class UserModal {
  String? userId;
  String? email;
  String? firstName;
  String? lastName;
  String? password;
  String? passwordToken;
  String? profilePhoto;
  String? birthdate;
  String? phone;
  String? gender;
  String? isLoginTime;
  String? wishList;
  String? createAt;
  String? updateAt;

  UserModal(
      {this.userId,
        this.email,
        this.firstName,
        this.lastName,
        this.password,
        this.passwordToken,
        this.profilePhoto,
        this.birthdate,
        this.phone,
        this.gender,
        this.isLoginTime,
        this.wishList,
        this.createAt,
        this.updateAt});

  UserModal.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    email = json['email'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    password = json['password'];
    passwordToken = json['passwordToken'];
    profilePhoto = json['profilePhoto'];
    birthdate = json['Birthdate'];
    phone = json['phone'];
    gender = json['gender'];
    isLoginTime = json['isLoginTime'];
    wishList = json['wishList'];
    createAt = json['createAt'];
    updateAt = json['updateAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['userId'] = userId;
    data['email'] = email;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['password'] = password;
    data['passwordToken'] = passwordToken;
    data['profilePhoto'] = profilePhoto;
    data['Birthdate'] = birthdate;
    data['phone'] = phone;
    data['gender'] = gender;
    data['isLoginTime'] = isLoginTime;
    data['wishList'] = wishList;
    data['createAt'] = createAt;
    data['updateAt'] = updateAt;
    return data;
  }
}

