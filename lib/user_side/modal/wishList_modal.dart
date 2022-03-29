class WishListModal {
  String? userID;
  String? productID;
  String? wishListID;
  String? productName;
  String? productImage;
  String? productPrice;

  WishListModal(
      {this.userID,
        this.productID,
        this.wishListID,
        this.productName,
        this.productImage,
        this.productPrice});

  WishListModal.fromJson(Map<String, dynamic> json) {
    userID = json['userID'];
    productID = json['productID'];
    wishListID = json['WishListID'];
    productName = json['ProductName'];
    productImage = json['productImage'];
    productPrice = json['productPrice'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['userID'] = userID;
    data['productID'] = productID;
    data['WishListID'] = wishListID;
    data['ProductName'] = productName;
    data['productImage'] = productImage;
    data['productPrice'] = productPrice;
    return data;
  }
}
