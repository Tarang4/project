import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/user_side/untils/app_fonts.dart';

class ConfirmOrder extends StatefulWidget {
  int? total;
   ConfirmOrder({Key? key, this.total}) : super(key: key);

  @override
  State<ConfirmOrder> createState() => _ConfirmOrderState();
}

class _ConfirmOrderState extends State<ConfirmOrder> {
  double? gst;
  double? finalprice;

  @override
  Widget build(BuildContext context) {
    gst = ((18 * widget.total! ) / 100);
    finalprice = gst! + double.parse(widget.total.toString());
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: (){
            Navigator.pop(context);
          },
            child: Icon(Icons.arrow_back_ios,color: Colors.black,)),
        backgroundColor: Colors.white,
        title: Text("Confirm Order",
        style: defaultTextStyle(),),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Text(widget.total.toString()),
          Text(gst.toString()),
          Text(finalprice.toString())
        ],
      ),
    );
  }
}
