import 'package:cloud_firestore/cloud_firestore.dart';

// class AddressModal {
//   String? userId;
//   String? addId;
//   String? fullName;
//   String? addStreetNo;
//   String? addStreet;
//   String? addCity;
//   String? addState;
//   String? addCountry;
//   String? addPinCode;
//
//   AddressModal(
//       {this.userId,
//         this.addId,
//         this.fullName,
//         this.addStreetNo,
//         this.addStreet,
//         this.addCity,
//         this.addState,
//         this.addCountry,
//         this.addPinCode});
//
//
//
//
//
//   AddressModal.fromJson(Map<String, dynamic> json) {
//     userId = json['userId'];
//     addId = json['addId'];
//     fullName = json['fullName'];
//     addStreetNo = json['addStreetNo'];
//     addStreet = json['addStreet'];
//     addCity = json['addCity'];
//     addState = json['addState'];
//     addCountry = json['addCountry'];
//     addPinCode = json['addPinCode'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['userId'] = this.userId;
//     data['addId'] = this.addId;
//     data['fullName'] = this.fullName;
//     data['addStreetNo'] = this.addStreetNo;
//     data['addStreet'] = this.addStreet;
//     data['addCity'] = this.addCity;
//     data['addState'] = this.addState;
//     data['addCountry'] = this.addCountry;
//     data['addPinCode'] = this.addPinCode;
//     return data;
//   }
// }
class AddressModal {
  String? userId;
  String? addId;
  String? fullName;
  String? addStreetNo;
  String? addStreet;
  String? addCity;
  String? addState;
  String? phoneNo;
  String? addCountry;
  String? addPinCode;

  AddressModal(
      {this.userId,
        this.addId,
        this.fullName,
        this.addStreetNo,
        this.addStreet,
        this.addCity,
        this.addState,
        this.phoneNo,
        this.addCountry,
        this.addPinCode});

  factory AddressModal.fromDocs(DocumentSnapshot? documentSnapshot){
    return AddressModal(
      userId: documentSnapshot!['userId'],
      addId : documentSnapshot['addId'],
      fullName : documentSnapshot['fullName'],
      addStreetNo : documentSnapshot['addStreetNo'],
      addStreet : documentSnapshot['addStreet'],
      addCity : documentSnapshot['addCity'],
      addState : documentSnapshot['addState'],
      addCountry : documentSnapshot['addCountry'],
      phoneNo : documentSnapshot['phoneNo'],
      addPinCode : documentSnapshot['addPinCode'],
    );
  }

  AddressModal.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    addId = json['addId'];
    fullName = json['fullName'];
    addStreetNo = json['addStreetNo'];
    addStreet = json['addStreet'];
    addCity = json['addCity'];
    addState = json['addState'];
    phoneNo = json['phoneNo'];
    addCountry = json['addCountry'];
    addPinCode = json['addPinCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['addId'] = this.addId;
    data['fullName'] = this.fullName;
    data['addStreetNo'] = this.addStreetNo;
    data['addStreet'] = this.addStreet;
    data['addCity'] = this.addCity;
    data['addState'] = this.addState;
    data['phoneNo'] = this.phoneNo;
    data['addCountry'] = this.addCountry;
    data['addPinCode'] = this.addPinCode;
    return data;
  }
}
