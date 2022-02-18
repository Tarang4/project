class UserModel {
  int? id;
  String? firstName;
  String? lastName;
  String? email;
  String? password;
  String? address;
  String? profile;
  String? phone;
  String? pincode;
  String? city;

  UserModel({this.id, this.firstName,this.lastName, this.email, this.password,this.address,this.phone,this.pincode,this.city,this.profile});

  UserModel.fromjson(Map<String, dynamic> map) {
    id = map["id"];
    firstName = map["firstname"];
    lastName = map["lastName"];
    email = map["email"];
    password = map["password"];
    address = map["address"];
    profile = map["profile"];
    phone = map["phone"];
    pincode = map["pincode"];
    city = map["city"];
  }

  Map<String,dynamic> toJson()=>{
    "id":id,
    "firstName":firstName,
    "lastName":lastName,
    "email":email,
    "password":password,
    "address":address,
    "profile":profile,
    "phone":phone,
    "pincode":pincode,
    "city":city,
  };

  Map<String, dynamic> toMap() {
    Map<String, dynamic> data = Map<String, dynamic>();
    data["id"] = id;
    data["firstName"] = firstName;
    data["lastName"] = lastName;
    data["email"] = email;
    data["password"] = password;
    data["address"] = address;
    data["profile"] = profile;
    data["phone"] = phone;
    data["pincode"] = pincode;
    data["city"] = city;
    return data;
  }
}
