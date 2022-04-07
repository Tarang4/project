class OrderModal {
  String? userId;
  String? orderId;
  String? total;
  String? date;
  String? finalTotal;
  String? gST;
  String? discount;
  String? method;
  List<ProductDetail>? productDetail;
  AddressDetail? addressDetail;
  CardDetail? cardDetail;

  OrderModal(
      {this.userId,
        this.orderId,
        this.total,
        this.date,
        this.finalTotal,
        this.gST,
        this.discount,
        this.method,
        this.productDetail,
        this.addressDetail,
        this.cardDetail});

  OrderModal.fromJson(Map<String, dynamic> json) {
    userId = json['UserId'];
    orderId = json['OrderId'];
    total = json['Total'];
    date = json['date'];
    finalTotal = json['FinalTotal'];
    gST = json['GST'];
    discount = json['Discount'];
    method = json['Method'];
    if (json['ProductDetail'] != null) {
      productDetail = <ProductDetail>[];
      json['ProductDetail'].forEach((v) {
        productDetail!.add(ProductDetail.fromJson(v));
      });
    }
    addressDetail = json['AddressDetail'] != null
        ? AddressDetail.fromJson(json['AddressDetail'])
        : null;
    cardDetail = json['CardDetail'] != null
        ? CardDetail.fromJson(json['CardDetail'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['UserId'] = userId;
    data['OrderId'] = orderId;
    data['Total'] = total;
    data['date'] = date;
    data['FinalTotal'] = finalTotal;
    data['GST'] = gST;
    data['Discount'] = discount;
    data['Method'] = method;
    if (productDetail != null) {
      data['ProductDetail'] =
          productDetail!.map((v) => v.toJson()).toList();
    }
    if (addressDetail != null) {
      data['AddressDetail'] = addressDetail!.toJson();
    }
    if (cardDetail != null) {
      data['CardDetail'] = cardDetail!.toJson();
    }
    return data;
  }
}

class ProductDetail {
  String? productImage;
  String? productName;
  String? pID;
  String? cartId;
  String? productPrice;

  ProductDetail(
      {this.productImage,
        this.productName,
        this.pID,
        this.cartId,
        this.productPrice});

  ProductDetail.fromJson(Map<String, dynamic> json) {
    productImage = json['productImage'];
    productName = json['productName'];
    pID = json['PID'];
    cartId = json['CartId'];
    productPrice = json['productPrice'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['productImage'] = productImage;
    data['productName'] = productName;
    data['PID'] = pID;
    data['CartId'] = cartId;
    data['productPrice'] = productPrice;
    return data;
  }
}

class AddressDetail {
  String? addId;
  String? fullName;
  String? address;
  String? phoneNo;

  AddressDetail({this.addId, this.fullName, this.address, this.phoneNo});

  AddressDetail.fromJson(Map<String, dynamic> json) {
    addId = json['addId'];
    fullName = json['fullName'];
    address = json['Address'];
    phoneNo = json['phoneNo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['addId'] = addId;
    data['fullName'] = fullName;
    data['Address'] = address;
    data['phoneNo'] = phoneNo;
    return data;
  }
}

class CardDetail {
  String? cardId;
  String? cardName;
  String? cardNo;
  String? expDate;
  String? cvv;

  CardDetail({this.cardId, this.cardName, this.cardNo, this.expDate, this.cvv});

  CardDetail.fromJson(Map<String, dynamic> json) {
    cardId = json['cardId'];
    cardName = json['cardName'];
    cardNo = json['cardNo'];
    expDate = json['exp_date'];
    cvv = json['cvv'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cardId'] = cardId;
    data['cardName'] = cardName;
    data['cardNo'] = cardNo;
    data['exp_date'] = expDate;
    data['cvv'] = cvv;
    return data;
  }
}
