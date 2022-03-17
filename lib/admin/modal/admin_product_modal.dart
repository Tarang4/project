class ProductModalAdmin {
  String? productId;
  String? uId;
  String? categories;
  String? productName;
  String? productInfo;
  String? productPrice;
  String? reviews;
  Images? images;
  ColorCode? colorCode;
  Size? size;

  ProductModalAdmin(
      {this.productId,
        this.uId,
        this.categories,
        this.productName,
        this.productInfo,
        this.productPrice,
        this.reviews,
        this.images,
        this.colorCode,
        this.size});

  ProductModalAdmin.fromJson(Map<String, dynamic> json) {
    productId = json['productId'];
    uId = json['UId'];
    categories = json['categories'];
    productName = json['productName'];
    productInfo = json['productInfo'];
    productPrice = json['productPrice'];
    reviews = json['reviews'];
    images =
    json['images'] != null ? new Images.fromJson(json['images']) : null;
    colorCode = json['ColorCode'] != null
        ? new ColorCode.fromJson(json['ColorCode'])
        : null;
    size = json['size'] != null ? new Size.fromJson(json['size']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['productId'] = this.productId;
    data['UId'] = this.uId;
    data['categories'] = this.categories;
    data['productName'] = this.productName;
    data['productInfo'] = this.productInfo;
    data['productPrice'] = this.productPrice;
    data['reviews'] = this.reviews;
    if (this.images != null) {
      data['images'] = this.images!.toJson();
    }
    if (this.colorCode != null) {
      data['ColorCode'] = this.colorCode!.toJson();
    }
    if (this.size != null) {
      data['size'] = this.size!.toJson();
    }
    return data;
  }
}

class Images {
  String? img1;
  String? img2;
  String? img3;
  String? img4;

  Images({this.img1, this.img2, this.img3, this.img4});

  Images.fromJson(Map<String, dynamic> json) {
    img1 = json['img1'];
    img2 = json['img2'];
    img3 = json['img3'];
    img4 = json['img4'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['img1'] = this.img1;
    data['img2'] = this.img2;
    data['img3'] = this.img3;
    data['img4'] = this.img4;
    return data;
  }
}

class ColorCode {
  String? color1;
  String? color2;
  String? color3;
  String? color4;

  ColorCode({this.color1, this.color2, this.color3, this.color4});

  ColorCode.fromJson(Map<String, dynamic> json) {
    color1 = json['color1'];
    color2 = json['color2'];
    color3 = json['color3'];
    color4 = json['color4'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['color1'] = this.color1;
    data['color2'] = this.color2;
    data['color3'] = this.color3;
    data['color4'] = this.color4;
    return data;
  }
}

class Size {
  String? s;
  String? m;
  String? xL;
  String? xXL;

  Size({this.s, this.m, this.xL, this.xXL});

  Size.fromJson(Map<String, dynamic> json) {
    s = json['S'];
    m = json['M'];
    xL = json['XL'];
    xXL = json['XXL'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['S'] = this.s;
    data['M'] = this.m;
    data['XL'] = this.xL;
    data['XXL'] = this.xXL;
    return data;
  }
}
