
import 'package:flutter/cupertino.dart';

class CategoriesModal  {
  late String catImage,catName;
  CategoriesModal({required this.catImage,required this.catName});
}
class  FeturedBrand{
  String? logo;
  String? name;
  String? products;
  FeturedBrand({this.logo,this.name,this.products});
}
class RecoList{
  String? image;
  String? title;
  String? detail;
  String? price;
  RecoList({this.image,this.title,this.detail,this.price});
}
class  TopBrand{
  String? logo;
  String? name;
  String? products;
  TopBrand({this.logo,this.name,this.products});
}