
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
  String? name;
  String? info;
  String? price;
  RecoList({this.image,this.name,this.info,this.price});
}
class  TopBrand{
  String? logo;
  String? name;
  String? products;
  TopBrand({this.logo,this.name,this.products});
}