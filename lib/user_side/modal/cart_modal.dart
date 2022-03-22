class CartModal {
  String? productId;
  String? addId;
  String? productName;
  String? productImage;
  String? productPrice;
  String? productColor;
  String? productSize;

  CartModal(
      {this.productId,
        this.addId,
        this.productName,
        this.productImage,
        this.productPrice,
        this.productColor,
        this.productSize});

  CartModal.fromJson(Map<String, dynamic> json) {
    productId = json['productId'];
    addId = json['addId'];
    productName = json['productName'];
    productImage = json['productImage'];
    productPrice = json['productPrice'];
    productColor = json['productColor'];
    productSize = json['productSize'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['productId'] = this.productId;
    data['addId'] = this.addId;
    data['productName'] = this.productName;
    data['productImage'] = this.productImage;
    data['productPrice'] = this.productPrice;
    data['productColor'] = this.productColor;
    data['productSize'] = this.productSize;
    return data;
  }
}
