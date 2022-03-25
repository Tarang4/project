import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../untils/toast/flutter_toast_method.dart';
import '../../config/FireStore_string.dart';

class CardRepository {
  static cardDetailAdd(
      {@required BuildContext? context,
      @required String? cardName,
      @required String? cardNo,
      @required String? cvv,
      @required String? exp_date}) async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    var id = _auth.currentUser?.uid;

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

    final CollectionReference _cardCollection = firebaseFirestore
        .collection(FirebaseString.userCollection)
        .doc(id)
        .collection(FirebaseString.cardCollection);

    DocumentReference? documentId;
    DocumentReference documentReferencer = _cardCollection.doc(documentId?.id);
    print(documentReferencer.id);

    Map<String, dynamic> cardData = <String, dynamic>{
      "userId": id,
      "cardId": documentReferencer.id,
      "cardName": cardName,
      "cardNo": cardNo,
      "exp_date": exp_date,
      "element_id": "",
      "cvv": cvv,
    };

    if (id != null) {
      await _cardCollection.add(cardData);

      ToastMethod.simpleToastLightColor(
          context: context, massage: "✔ Card Added");

      debugPrint('yes add card');
    } else {
      ToastMethod.simpleToast(context: context, massage: "no add detail");

      debugPrint('No add card');
    }
  }

  static cardDetailUpdate(
      {@required BuildContext? context,
      @required String? cardId,
      @required String? cardName,
      @required String? cardNo,
      @required String? cvv,
      @required String? exp_date}) async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    var id = _auth.currentUser?.uid;

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

    final CollectionReference _cardCollection = firebaseFirestore
        .collection(FirebaseString.userCollection)
        .doc(id)
        .collection(FirebaseString.cardCollection);

    Map<String, dynamic> cardData = <String, dynamic>{
      "cardName": cardName,
      "cardNo": cardNo,
      "exp_date": exp_date,
      "cvv": cvv,
      "element_id": "",
    };

    if (id != null) {
      _cardCollection.where("cardId", isEqualTo: cardId).get().then((res) {
        res.docs.forEach((result) {
          _cardCollection.doc(result.id).update(cardData);
        });
      });

      ToastMethod.simpleToastLightColor(context: context, massage: "✔ Card Updated");

      debugPrint('yes update card');
    } else {
      ToastMethod.simpleToastLightColor(context: context, massage: "no add detail");

      debugPrint('No update card');
    }
  }

  static cardDetailDelete({
    @required BuildContext? context,
    @required String? cardId,
  }) {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    var id = _auth.currentUser?.uid;

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

    final CollectionReference _cardCollection = firebaseFirestore
        .collection(FirebaseString.userCollection)
        .doc(id)
        .collection(FirebaseString.cardCollection);

    _cardCollection.where('cardId', whereIn: [cardId]).get().then((snapshot) {
          snapshot.docs[0].reference.delete();
        });
  }
}
