class CardModel {
  int? id;
  String? cardnumber;
  String? expirydate;
  String? cardname;
  String? cvv;

  CardModel({
    this.id,
    this.cardnumber,
    this.expirydate,
    this.cardname,
    this.cvv,
  });

  CardModel.fromJson(Map<String, dynamic> map) {
    id = map["id"];
    cardnumber = map["cardnumber"];
    expirydate = map["expirydate"];
    cardname = map["cardname"];
    cvv = map["cvv"];
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "cardnumber": cardnumber,
    "expirydate": expirydate,
    "cardname": cardname,
    "cvv": cvv,
  };
}
