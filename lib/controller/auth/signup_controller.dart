import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:untitled/screens/explore%20screen/explore_screen.dart';

class SignupController extends GetxController {
  final userCollectionId = GetStorage();

  RxBool obscureText = true.obs;
  RxBool checkBoxValue = false.obs;



  final FirebaseAuth _auth = FirebaseAuth.instance;

  final Rx<User?> _firebaseUser = Rx<User?>(null);
  User? get data => _firebaseUser.value;
  String? get user => _firebaseUser.value!.email;

  @override
  void onInit() {
    super.onInit();
    _firebaseUser.bindStream(_auth.authStateChanges());
  }

  // function to createuser, login and sign out user

  void createUser(context, String email, String password, String name) async {
    CollectionReference reference =
    FirebaseFirestore.instance.collection("user");

    Map<String, dynamic> userdata = {
      "email": email,
      "password": password,
      'name': name,
    };

    await _auth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      reference.add(userdata).then((value) {
        userCollectionId.write("userCollectionId", value.id);
        Navigator.pushReplacement(
            context,
            CupertinoPageRoute(
              builder: (context) => const ExploreScreen(),
            ));
      });
    }).catchError(
          (onError) =>
      // ignore: invalid_return_type_for_catch_error
      Get.snackbar("Error while creating account ", onError.message),
    );
  }
}
