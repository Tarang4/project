import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_credit_card/credit_card_brand.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';
import 'package:flutter_credit_card/custom_card_type_icon.dart';
import 'package:flutter_credit_card/glassmorphism_config.dart';
import 'package:untitled/user_side/modal/cart_modal.dart';
import 'package:untitled/user_side/repository/add_account/add_cards_repository.dart';
import 'package:untitled/user_side/untils/app_fonts.dart';
import 'package:untitled/user_side/untils/toast/flutter_toast_method.dart';

import '../../../admin/repository/admin_order_repository.dart';
import '../../config/FireStore_string.dart';
import '../../config/app_colors.dart';
import '../../modal/credit_card_model.dart';
import '../../repository/add_account/order_repository.dart';
import '../account screen/cards screen/addnew_card.dart';
import '../account screen/cards screen/edit_card.dart';
import '../explore screen/main_home_screen.dart';

class CheckoutPayment extends StatefulWidget {
  int? total;
  final String? addressID;
  final String? address;
  final String? addFullName;
  final String? addPhoneNo;
  final List<CartModal>? cartList;

  CheckoutPayment({
    Key? key,
    this.total,
    this.addressID,
    this.address,
    this.addFullName,
    this.addPhoneNo,
    required this.cartList,
  }) : super(key: key);

  @override
  State<CheckoutPayment> createState() => _CheckoutPaymentState();
}

class _CheckoutPaymentState extends State<CheckoutPayment> {
  late int id;
  int? grpValue;
  int? discount = 0;
  String? method;
  String? cardID;
  String? cardName;
  String? cardNo;
  String? exp_date;
  String? cvv;

  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;
  bool useGlassMorphism = false;
  bool useBackgroundImage = false;
  OutlineInputBorder? border;
  double? gst;
  double? finalprice;
  String? uid;
  bool isCard = true;

  bool isCOD = false;
  Map<String, dynamic>? paymentIntentData;

  TextEditingController discountController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User? user = auth.currentUser;
    uid = user?.uid;
  }

  @override
  Widget build(BuildContext context) {
    gst = ((18 * widget.total!) / 100);
    finalprice = gst! + double.parse(widget.total.toString()) - discount!;
    return WillPopScope(
      onWillPop: () {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => const MainHomeScreen(),
            ),
            (route) => false);
        return Future(() => false);
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: colorWhite.withOpacity(0.1),
          centerTitle: true,
          title: Text(
            "Checkout Payment",
            style: defaultTextStyle(
                fontSize: 20.0,
                fontColors: colorBlack,
                fontWeight: FontWeight.normal),
          ),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
              size: 17,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                margin: const EdgeInsets.only(
                    left: 16, right: 16, top: 32, bottom: 12),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Stack(
                      children: [
                        Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border:
                                  Border.all(width: 1.0, color: colorGreen)),
                        ),
                        Positioned(
                          right: 5,
                          left: 5,
                          top: 5,
                          bottom: 5,
                          child: Container(
                            height: 10,
                            width: 10,
                            decoration: const BoxDecoration(
                                color: colorGreen, shape: BoxShape.circle),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: 1,
                      width: MediaQuery.of(context).size.width / 3,
                      color: colorGreen,
                    ),
                    Stack(
                      children: [
                        Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border:
                                  Border.all(width: 1.0, color: colorGreen)),
                        ),
                        Positioned(
                          right: 5,
                          left: 5,
                          top: 5,
                          bottom: 5,
                          child: Container(
                            height: 10,
                            width: 10,
                            decoration: const BoxDecoration(
                                color: colorGreen, shape: BoxShape.circle),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: 1,
                      width: MediaQuery.of(context).size.width / 3,
                      color: colorGreen,
                    ),
                    Stack(
                      children: [
                        Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border:
                                  Border.all(width: 1.0, color: colorGreen)),
                        ),
                        Positioned(
                          right: 5,
                          left: 5,
                          top: 5,
                          bottom: 5,
                          child: Container(
                            height: 10,
                            width: 10,
                            decoration: const BoxDecoration(
                                color: colorGreen, shape: BoxShape.circle),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 16, right: 16, bottom: 35),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text("Delivery"),
                    Text("Address"),
                    Text("Payments"),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 500,
              ),
              Container(
                margin: const EdgeInsets.only(left: 15, right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _paymentClick(
                                one: true,
                                two: false,
                              );
                              method = "Card Payment";
                            });
                          },
                          child: Container(
                            height: 45,
                            width: 150,
                            padding: const EdgeInsets.only(right: 10, left: 6),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                color: isCard == true
                                    ? colorGreen
                                    : colorLightGrey,
                                width: 1.5,
                              ),
                            ),
                            child: Image.asset(
                              "assets/images/icons/credit-card.png",
                              color: isCard == true ? null : colorLightGrey,
                              height: 30,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Cards",
                          style: defaultTextStyle(
                              fontWeight: FontWeight.w300, fontSize: 14.0),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _paymentClick(
                                one: false,
                                two: true,
                              );
                              method = "Cash on Delivery";
                            });
                          },
                          child: Container(
                            height: 50,
                            width: 150,
                            padding: const EdgeInsets.only(right: 10, left: 6),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                color:
                                    isCOD == true ? colorGreen : colorLightGrey,
                                width: 1.5,
                              ),
                            ),
                            child: Image.asset(
                              "assets/images/icons/cash-on-delivery.png",
                              color: isCOD == true ? null : colorLightGrey,
                              height: 30,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          "COD",
                          style: defaultTextStyle(
                              fontWeight: FontWeight.w300, fontSize: 14.0),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              isCard == true ? cardFN() : Container(),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 244,
                width: double.infinity,
                margin: const EdgeInsets.all(15),
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: colorWhite,
                    boxShadow: const [
                      BoxShadow(
                          offset: Offset(5, 5),
                          spreadRadius: 1,
                          blurRadius: 2,
                          color: colorLightGrey)
                    ]),
                child: Column(
                  children: [
                    Container(
                      height: 40,
                      padding: const EdgeInsets.all(5),
                      width: double.infinity,
                      decoration: const BoxDecoration(),
                      child: Row(
                        children: [
                          Container(
                            width: 240,
                            margin: const EdgeInsets.only(left: 8),
                            padding: const EdgeInsets.all(1),
                            child: TextFormField(
                              controller: discountController,
                              cursorColor: colorGreen,
                              cursorHeight: 18,
                              cursorWidth: 1.2,
                              maxLength: 10,
                              inputFormatters: [
                                UpperCaseTextFormatter(),
                              ],
                              textInputAction: TextInputAction.next,
                              style: defaultTextStyle(
                                  fontSize: 18.0, fontWeight: FontWeight.w400),
                              decoration: const InputDecoration(
                                hintText: "APPLY COUPON CODE",
                                hintStyle: TextStyle(fontSize: 13),
                                counterText: "",
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: colorGreen),
                                ),
                              ),
                            ),
                          ),
                          const Spacer(),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                primary: colorGreen, // background
                              ),
                              onPressed: () {
                                FocusScopeNode currentFocus =
                                    FocusScope.of(context);
                                if (!currentFocus.hasPrimaryFocus) {
                                  currentFocus.unfocus();
                                  setState(() {
                                    if (discountController.text ==
                                        "SNATCHSHIP") {
                                      setState(() {
                                        discount = 100;
                                      });
                                    } else if (discountController.text ==
                                        "100LUCKY") {
                                      setState(() {
                                        discount = 100;
                                      });
                                    } else if (discountController.text ==
                                        "WELCOME200") {
                                      setState(() {
                                        discount = 200;
                                      });
                                    } else if (discountController.text ==
                                        "COMBO50") {
                                      setState(() {
                                        discount = 50;
                                      });
                                    } else {
                                      setState(() {
                                        discount = 0;
                                      });
                                    }
                                  });
                                }
                              },
                              child: Text(
                                "APPLY",
                                style: defaultTextStyle(
                                    fontSize: 12.0,
                                    fontColors: colorWhite,
                                    fontWeight: FontWeight.w500),
                              ))
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                          left: 15, right: 15, top: 10, bottom: 10),
                      child: Row(
                        children: [
                          Text(
                            "TOTAL",
                            style: defaultTextStyle(
                                fontColors: colorBlack,
                                fontWeight: FontWeight.w300),
                          ),
                          const Spacer(),
                          Text(
                            widget.total.toString(),
                            style: defaultTextStyle(),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                          left: 15, right: 15, top: 10, bottom: 10),
                      child: Row(
                        children: [
                          Text(
                            "GST(18%)",
                            style: defaultTextStyle(
                                fontColors: colorBlack,
                                fontWeight: FontWeight.w300),
                          ),
                          const Spacer(),
                          Text(
                            gst.toString(),
                            style: defaultTextStyle(),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                          left: 15, right: 15, top: 10, bottom: 15),
                      child: Row(
                        children: [
                          Text(
                            "DISCOUNT",
                            style: defaultTextStyle(
                                fontColors: colorBlack,
                                fontWeight: FontWeight.w300),
                          ),
                          const Spacer(),
                          Text(
                            discount == 0 ? "0" : discount.toString(),
                            style: defaultTextStyle(),
                          ),
                        ],
                      ),
                    ),
                    DottedLine(
                      direction: Axis.horizontal,
                      lineLength: double.infinity,
                      lineThickness: 1.0,
                      dashLength: 4.0,
                      dashColor: Colors.black,
                      dashGradient: const [colorGrey, colorGreen],
                      dashRadius: 0.0,
                      dashGapLength: 4.0,
                      dashGapColor: Colors.transparent,
                      dashGapRadius: 0.0,
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                          left: 15, right: 15, top: 15, bottom: 10),
                      child: Row(
                        children: [
                          Text(
                            "FINAL TOTAL",
                            style: defaultTextStyle(),
                          ),
                          const Spacer(),
                          Text(
                            finalprice.toString(),
                            // int.parse(finalprice.toString()).toStringAsFixed(2),
                            style: defaultTextStyle(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 10,
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {
                        if(grpValue==null){
                          ToastMethod.simpleToastLightColor(massage: "Add Your Card Details !");
                        }
                        else {
                          OrderRepository.orderAddUser(
                            context: context,
                            total: widget.total.toString(),
                            GST: gst.toString(),
                            discount: discount.toString(),
                            finalTotal: finalprice.toString(),
                            addressId: widget.addressID.toString(),
                            cardId: cardID.toString(),
                            method: method.toString(),
                            cvv: cvv.toString(),
                            cardName: cardName.toString(),
                            cardNo: cardNo.toString(),
                            expDate: exp_date.toString(),
                            addressPhone: widget.addPhoneNo.toString(),
                            address: widget.address.toString(),
                            addressFullName: widget.addFullName.toString(),
                            cartList: widget.cartList,
                          );
                          AdminOrderRepository.orderAddAdmin(
                            context: context,
                            total: widget.total.toString(),
                            GST: gst.toString(),
                            discount: discount.toString(),
                            finalTotal: finalprice.toString(),
                            addressId: widget.addressID.toString(),
                            cardId: cardID.toString(),
                            method: method.toString(),
                            cvv: cvv.toString(),
                            cardName: cardName.toString(),
                            cardNo: cardNo.toString(),
                            expDate: exp_date.toString(),
                            addressPhone: widget.addPhoneNo.toString(),
                            address: widget.address.toString(),
                            addressFullName: widget.addFullName.toString(),
                            cartList: widget.cartList,
                          );
                        }
                      },
                      child: Container(
                        height: 50,
                        width: 146,
                        margin: const EdgeInsets.only(right: 30),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: colorGreen,
                            borderRadius: BorderRadius.circular(5)),
                        child: Text(
                          "PLACE ORDER",
                          style: defaultTextStyle(
                              fontColors: colorWhite,
                              fontSize: 14.0,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _paymentClick({
    bool one = false,
    bool two = false,
  }) {
    setState(() {
      isCard = one;
      isCOD = two;
    });
  }

  cardFN() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          InkWell(
            splashColor: Colors.transparent,
            onTap: () {
              Navigator.push(context,
                  CupertinoPageRoute(builder: (context) => const AddCard()));
            },
            child: Container(
              height: 30,
              width: 105,
              margin: const EdgeInsets.only(right: 20),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: colorGreen),
                  borderRadius: BorderRadius.circular(5)),
              child: Text(
                " ADD NEW CARD",
                style: defaultTextStyle(
                    fontColors: colorBlack,
                    fontSize: 13.0,
                    fontWeight: FontWeight.w400),
              ),
            ),
          ),
          StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection(FirebaseString.userCollection)
                .doc(uid)
                .collection(FirebaseString.cardCollection)
                .snapshots(),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: snapshot.data.docs.length,
                  itemBuilder: (BuildContext context, int index) {
                    DebitCardModal debitCardModal =
                        DebitCardModal.fromDocs(snapshot.data.docs[index]);
                    return Column(
                      children: [
                        InkWell(
                          onTap: () async {
                            Navigator.push(
                              context,
                              CupertinoPageRoute(
                                builder: (context) => EditCard(
                                  id: debitCardModal.cardId.toString(),
                                  cardName: debitCardModal.cardName.toString(),
                                  cvv: debitCardModal.cvv.toString(),
                                  expDate: debitCardModal.expDate.toString(),
                                  cardNumber: debitCardModal.cardNo.toString(),
                                ),
                              ),
                            );
                          },
                          child: CreditCardWidget(
                            glassmorphismConfig: useGlassMorphism
                                ? Glassmorphism.defaultConfig()
                                : null,
                            cardNumber: debitCardModal.cardNo.toString(),
                            expiryDate: debitCardModal.expDate.toString(),
                            cardHolderName: debitCardModal.cardName.toString(),
                            cvvCode: debitCardModal.cvv.toString(),
                            showBackView: isCvvFocused,
                            obscureCardNumber: true,
                            obscureCardCvv: true,
                            isHolderNameVisible: true,
                            cardBgColor: Colors.green,
                            backgroundImage: useBackgroundImage
                                ? 'assets/card_bg.png'
                                : null,
                            isSwipeGestureEnabled: true,
                            onCreditCardWidgetChange:
                                (CreditCardBrand creditCardBrand) {},
                            customCardTypeIcons: <CustomCardTypeIcon>[
                              CustomCardTypeIcon(
                                cardType: CardType.mastercard,
                                cardImage: Image.asset(
                                  'packages/flutter_credit_card/icons/mastercard.png',
                                  height: 48,
                                  width: 48,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            const SizedBox(
                              width: 20,
                            ),
                            Text(
                              "Select Card",
                              style: defaultTextStyle(
                                  fontSize: 14.0, fontWeight: FontWeight.w500),
                            ),
                            Radio(
                                value: index,
                                activeColor: colorGreen,
                                groupValue: grpValue,
                                onChanged: (int? value) {
                                  setState(() {
                                    grpValue = value!;
                                    cardID = debitCardModal.cardId.toString();
                                    cvv = debitCardModal.cvv.toString();
                                    cardName =
                                        debitCardModal.cardName.toString();
                                    cardNo = debitCardModal.cardNo.toString();
                                    exp_date =
                                        debitCardModal.expDate.toString();
                                  });
                                }),
                            const Spacer(),
                            InkWell(
                              splashColor: Colors.transparent,
                              onTap: () {
                                CardRepository.cardDetailDelete(
                                    context: context,
                                    cardId: debitCardModal.cardId.toString());
                              },
                              child: Container(
                                height: 25,
                                width: 55,
                                margin: const EdgeInsets.only(right: 16),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    border:
                                        Border.all(color: colorGreen, width: 1),
                                    borderRadius: BorderRadius.circular(5)),
                                child: Text(
                                  "Delete",
                                  style: defaultTextStyle(
                                      fontColors: colorBlack,
                                      fontSize: 13.0,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                );
              }
              return const Center(
                child: CircularProgressIndicator(
                  color: colorGreen,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
