import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import '../../../main.dart';
import '../../config/FireStore_string.dart';
import '../../config/Localstorage_string.dart';
import '../../config/local_storage.dart';
import '../../modal/address_modal.dart';
import '../../untils/toast/flutter_toast_method.dart';

class AddressRepository {
  static addressDetailAdd(
      {@required BuildContext? context,
      @required String? fullName,
      @required String? addStreet1,
      @required String? addStreet2,
      @required String? country,
      @required String? state,
      @required String? city,
      @required String? phone,
      @required String? addPinCode}) async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    var id = _auth.currentUser?.uid;

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    String Uid = pref!.getString(LocalStorageKey.userId)!;

    final CollectionReference _addressCollection = firebaseFirestore
        .collection(FirebaseString.userCollection)
        .doc(id)
        .collection(FirebaseString.addressCollection);

    DocumentReference? documentId;
    DocumentReference documentReferencer =
        _addressCollection.doc(documentId?.id);
    print(documentReferencer.id);
    AddressModal addressModal = AddressModal(
        addStreet: addStreet2,
        addStreetNo: addStreet1,
        addCity: city,
        addPinCode: addPinCode,
        addCountry: country,
        addState: state,
        userId: id,
        fullName: fullName);
    Map<String, dynamic> addressData = <String, dynamic>{
      "userId": Uid,
      "addId": documentReferencer.id,
      "fullName": fullName,
      "addStreetNo": addStreet1,
      "addStreet": addStreet2,
      "addCity": city,
      "addState": state,
      "phoneNo": phone,
      "addCountry": country,
      "addPinCode": addPinCode,
    };

    if (id != null) {
      await _addressCollection.add(addressData);

      ToastMethod.simpleToast(context: context, massage: "add detail");

      debugPrint('yes add card');
    } else {
      ToastMethod.simpleToast(context: context, massage: "no add detail");

      debugPrint('No add card');
    }
  }

  static addressDetailUpdate(
      {@required BuildContext? context,
      @required String? addId,
      @required String? fullName,
      @required String? addStreet1,
      @required String? addStreet2,
      @required String? country,
      @required String? state,
      @required String? city,
      @required String? phone,
      @required String? addPinCode}) async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    var id = _auth.currentUser?.uid;
    String Uid = pref!.getString(LocalStorageKey.userId)!;

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

    final CollectionReference _addressCollection = firebaseFirestore
        .collection(FirebaseString.userCollection)
        .doc(id)
        .collection(FirebaseString.addressCollection);
    Map<String, dynamic> addressData = <String, dynamic>{
      "fullName": fullName,
      "addStreetNo": addStreet1,
      "addStreet": addStreet2,
      "addCity": city,
      "addState": state,
      "addCountry": country,
      "addPinCode": addPinCode,
      "phoneNo": phone,

    };

    if (id != null) {
      _addressCollection.where("addId", isEqualTo: addId).get().then((res) {
        res.docs.forEach((result) {
          _addressCollection.doc(result.id).update(addressData);
        });
      });

      ToastMethod.simpleToast(context: context, massage: "add detail");

      debugPrint('yes update card');
    } else {
      ToastMethod.simpleToast(context: context, massage: "no add detail");

      debugPrint('No update card');
    }
  }

  static AddressDetailDelete({
    @required BuildContext? context,
    @required String? addId,
  }) {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    var id = _auth.currentUser?.uid;

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

    final CollectionReference _cardCollection = firebaseFirestore
        .collection(FirebaseString.userCollection)
        .doc(id)
        .collection(FirebaseString.addressCollection);

    _cardCollection.where('addId', whereIn: [addId]).get().then((snapshot) {
      snapshot.docs[0].reference.delete();
    });
  }
}
