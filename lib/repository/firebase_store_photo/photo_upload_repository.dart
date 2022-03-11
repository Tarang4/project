import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class FireBasePhoto{
  static UploadTask? uploadFile(String destination,File file){
    DateTime dateTime = DateTime.now();

    final Reference storageReference = FirebaseStorage.instance
        .ref(destination);
    return storageReference.child("ProfileImage of $dateTime.jpg").putFile(file);


  }
}