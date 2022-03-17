import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class ProductPhotoRepository{
  static UploadTask? uploadFile(String destination,File file,String productName){

    final Reference storageReference = FirebaseStorage.instance
        .ref(destination);
    return storageReference.child("Number_Of_Image_$productName").putFile(file);


  }
}