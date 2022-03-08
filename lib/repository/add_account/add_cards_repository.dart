import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

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
    DocumentReference documentReferencer =
    _cardCollection.doc(documentId?.id);
    print(documentReferencer.id);

    Map<String, dynamic> cardData = <String, dynamic>{
      "userId": id,
      "cardId": documentReferencer.id,
      "cardName": cardName,
      "cardNo": cardNo,
      "exp_date": exp_date,
      "cvv": cvv,
    };

    if (id != null) {
      await _cardCollection.add(cardData);

      ToastMethod.simpleToast(context: context, massage: "add detail");

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
    };

    if (id != null) {
_cardCollection
          .where("cardId", isEqualTo: cardId)
          .get()
          .then((res) {
        res.docs.forEach((result) {
          _cardCollection
              .doc(result.id)
              .update(cardData);
        });
      });


      ToastMethod.simpleToast(context: context, massage: "add detail");

      debugPrint('yes update card');
    } else {
      ToastMethod.simpleToast(context: context, massage: "no add detail");

      debugPrint('No update card');
    }
  }

  static cardDetailDelete({@required BuildContext? context}) {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    var id = _auth.currentUser?.uid;

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

    final CollectionReference _cardCollection =
        firebaseFirestore.collection(FirebaseString.userCollection)
    .doc(id)
    .collection(FirebaseString.cardCollection);

    Future<QuerySnapshot> card =_cardCollection.get();
    card.then((value) {
      value.docs.forEach((element) {
       _cardCollection
            .doc(element.id)
            .delete()
            .then((value) => ToastMethod.simpleToast(
                context: context, massage: "Delete card successfully"));
      });
    });
  }
}
