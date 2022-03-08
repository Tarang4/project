import 'package:cloud_firestore/cloud_firestore.dart';

class DebitCardModal {
  String? cardId;
  String? userId;
  String? cardNo;
  String? cvv;
  String? expDate;
  String? cardName;

  DebitCardModal({this.cardId,this.userId, this.cardNo, this.cvv, this.expDate, this.cardName});



  factory DebitCardModal.fromDocs(DocumentSnapshot? documentSnapshot){
    return DebitCardModal(
      userId: documentSnapshot!['userId'],
      cardId: documentSnapshot!['cardId'],
      cardName:  documentSnapshot['cardName'],
      cardNo: documentSnapshot['cardNo'],
      cvv: documentSnapshot['cvv'],
      expDate: documentSnapshot['exp_date'],
    );
  }



  DebitCardModal.fromJson(Map<String, dynamic> json) {
    userId = json['card_Id'];
    cardId = json['user_Id'];
    cardNo = json['card_No'];
    cvv = json['cvv'];
    expDate = json['exp_date'];
    cardName = json['cardName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_Id'] = this.userId;
    data['card_Id'] = this.cardId;
    data['card_No'] = this.cardNo;
    data['cvv'] = this.cvv;
    data['exp_date'] = this.expDate;
    data['cardName'] = this.cardName;
    return data;
  }
}