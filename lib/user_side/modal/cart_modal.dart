class CartModal {
  String? productId;
  String? addId;
  String? productName;
  String? productImage;
  String? productPrice;
  String? productColor;
  String? productSize;
  int? quantity;

  CartModal(
      {this.productId,
        this.addId,
        this.productName,
        this.productImage,
        this.productPrice,
        this.productColor,
        this.quantity,
        this.productSize});

  CartModal.fromJson(Map<String, dynamic> json) {
    productId = json['productId'];
    addId = json['addId'];
    productName = json['productName'];
    productImage = json['productImage'];
    productPrice = json['productPrice'];
    productColor = json['productColor'];
    productSize = json['productSize'];
    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['productId'] = productId;
    data['addId'] = addId;
    data['productName'] = productName;
    data['productImage'] = productImage;
    data['productPrice'] = productPrice;
    data['productColor'] = productColor;
    data['productSize'] = productSize;
    data['quantity'] = quantity;
    return data;
  }
}
