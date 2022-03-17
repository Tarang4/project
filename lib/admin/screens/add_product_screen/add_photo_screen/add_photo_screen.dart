import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:path/path.dart' as Path;
import 'package:untitled/user_side/config/app_colors.dart';

import '../../../../user_side/config/FireStore_string.dart';

class AddImagee extends StatefulWidget {
  final int? grpValue;
  final String? productName;
  const AddImagee({Key? key,required this.grpValue,required this.productName}) : super(key: key);

  @override
  _AddImageeState createState() => _AddImageeState();
}

class _AddImageeState extends State<AddImagee> {
  bool uploading = false;
  double val = 0;
  late CollectionReference imgRef;
  late firebase_storage.Reference ref;

  final List<File> _image = [];
  final picker = ImagePicker();
  int? grpValue;
  String? productName;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(backgroundColor: colorGreen,
            title: const Text('Add Image'),
            actions: [
              FlatButton(
                  onPressed: () {
                    setState(() {
                      uploading = true;
                    });
                    uploadFile().whenComplete(() => Navigator.of(context).pop());
                  },
                  child: const Text(
                    'upload',
                    style: TextStyle(color: Colors.white),
                  ))
            ],
          ),
          body: Stack(
            children: [
              Container(
                padding: const EdgeInsets.all(5),
                child: GridView.builder(
                    itemCount: _image.length + 1,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3),
                    itemBuilder: (context, index) {
                      return index == 0
                          ? Container(color: colorGreen.withOpacity(0.1),margin: EdgeInsets.all(3),
                            child: Center(
                        child: IconButton(
                              icon: const Icon(Icons.add),
                              onPressed: () =>
                              !uploading ? chooseImage() : null),
                      ),
                          )
                          : Container(
                        margin: const EdgeInsets.all(3),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: FileImage(_image[index - 1]),
                              fit: BoxFit.cover),
                        ),
                      );
                    }),
              ),
              uploading
                  ? Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        child: const Text(
                          'uploading...',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CircularProgressIndicator(
                        value: val,
                        valueColor:
                        const AlwaysStoppedAnimation<Color>(Colors.green),
                      )
                    ],
                  ))
                  : Container(),
            ],
          )),
    );
  }

  chooseImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      _image.add(File(pickedFile!.path));
    });
    if (pickedFile!.path == null) retrieveLostData();
  }

  Future<void> retrieveLostData() async {
    final LostData response = await picker.getLostData();
    if (response.isEmpty) {
      return;
    }
    if (response.file != null) {
      setState(() {
        _image.add(File(response.file!.path));
      });
    } else {
      print(response.file);
    }
  }

  Future uploadFile() async {
    int i = 1;
    for (var img in _image) {
      setState(() {
        val = i / _image.length;
      });
      final destination = 'Product_Images/$grpValue/$productName';

      ref = firebase_storage.FirebaseStorage.instance
          .ref(destination)
          .child('images${Path.basename(img.path)}');
      await ref.putFile(img).whenComplete(
            () async {
          await ref.getDownloadURL().then(
                (value) {
              imgRef.add({'url': value});
              i++;
            },
          );
        },
      );
    }
  }

  @override
  void initState() {
    grpValue=widget.grpValue;
    productName=widget.productName;
    super.initState();
    imgRef = FirebaseFirestore.instance.collection(FirebaseString.productCollection).doc().collection("imageUrl");
  }
}
