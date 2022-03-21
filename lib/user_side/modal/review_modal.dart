class ReviewModal {
  String? productId;
  String? reviewId;
  String? reviewText;
  String? star;
  String? userprofile;
  String? userName;
  String? userId;

  ReviewModal(
      {this.productId,
        this.reviewId,
        this.reviewText,
        this.star,
        this.userprofile,
        this.userName,
        this.userId});

  ReviewModal.fromJson(Map<String, dynamic> json) {
    productId = json['productId'];
    reviewId = json['reviewId'];
    reviewText = json['reviewText'];
    star = json['star'];
    userprofile = json['userprofile'];
    userName = json['userName'];
    userId = json['userId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['productId'] = productId;
    data['reviewId'] = reviewId;
    data['reviewText'] = reviewText;
    data['star'] = star;
    data['userprofile'] = userprofile;
    data['userName'] = userName;
    data['userId'] = userId;
    return data;
  }
}
