// ignore_for_file: avoid_print
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_brand.dart';
import 'package:flutter_credit_card/credit_card_form.dart';
import 'package:flutter_credit_card/credit_card_model.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';
import 'package:flutter_credit_card/custom_card_type_icon.dart';
import 'package:flutter_credit_card/glassmorphism_config.dart';
import '../../../config/app_colors.dart';
import '../../../repository/add_account/add_cards_repository.dart';
import '../../../untils/app_fonts.dart';
import 'card_screen.dart';

class EditCard extends StatefulWidget {
  final String cardNumber;
  final String id;
  final String cardName;
  final String expDate;
  final String cvv;

  const EditCard(
      {Key? key,
      required this.cardNumber,
      required this.expDate,
      required this.cvv,
      required this.cardName,
      required this.id})
      : super(key: key);

  @override
  _EditCardState createState() => _EditCardState();
}

class _EditCardState extends State<EditCard> {
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  String? cardId;
  bool isCvvFocused = false;
  bool useGlassMorphism = false;
  bool useBackgroundImage = false;
  OutlineInputBorder? border;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  int pageIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cardNumber = widget.cardNumber;
    cardHolderName = widget.cardName;
    cvvCode = widget.cvv;
    expiryDate = widget.expDate;
    cardId = widget.id;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: colorWhite.withOpacity(0.2),
        centerTitle: true,
        title: Text(
          "Edit Card",
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
      body: SafeArea(
        child: Column(
          children: [
            CreditCardWidget(
              glassmorphismConfig:
                  useGlassMorphism ? Glassmorphism.defaultConfig() : null,
              cardNumber: cardNumber,
              expiryDate: expiryDate,
              cardHolderName: cardHolderName,
              cvvCode: cvvCode,
              showBackView: isCvvFocused,
              obscureCardNumber: true,
              obscureCardCvv: true,
              isHolderNameVisible: true,
              cardBgColor: Colors.green,
              backgroundImage: useBackgroundImage ? 'assets/card_bg.png' : null,
              isSwipeGestureEnabled: true,
              onCreditCardWidgetChange: (CreditCardBrand creditCardBrand) {},
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
            InkWell(
              onTap: () {
                CardRepository.cardDetailDelete(
                    context: context, cardId: cardId);
                Navigator.pop(context);
              },
              child: Container(
                height: 28,
                width: 100,
                margin: const EdgeInsets.only(left: 250),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(width: 1, color: colorGreen)),
                child:  Text("REMOVE CARD",style: defaultTextStyle(fontSize: 12.0,fontWeight: FontWeight.w300),),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    CreditCardForm(
                      cursorColor: colorGreen,
                      formKey: formKey,
                      obscureCvv: true,
                      obscureNumber: true,
                      cardNumber: cardNumber,
                      cvvCode: cvvCode,
                      isHolderNameVisible: true,
                      isCardNumberVisible: true,
                      isExpiryDateVisible: true,
                      cardHolderName: cardHolderName,
                      expiryDate: expiryDate,
                      themeColor: colorGreen,
                      textColor: Colors.black,
                      cardNumberDecoration: InputDecoration(
                        labelText: 'Card Number',
                        hintText: 'XXXX XXXX XXXX XXXX',
                        hintStyle: const TextStyle(color: Colors.black),
                        labelStyle: const TextStyle(
                          color: colorGrey,
                        ),
                        focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: colorGreen,
                            width: 1,
                          ),
                        ),
                        enabledBorder: border,
                      ),
                      expiryDateDecoration: InputDecoration(
                        hintStyle: const TextStyle(color: Colors.black),
                        labelStyle: const TextStyle(color: colorGrey),
                        focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: colorGreen,
                            width: 1,
                          ),
                        ),
                        enabledBorder: border,
                        labelText: 'Expired Date',
                        hintText: 'XX/XX',
                      ),
                      cvvCodeDecoration: InputDecoration(
                        hintStyle: const TextStyle(color: Colors.black),
                        labelStyle: const TextStyle(color: colorGrey),
                        focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: colorGreen,
                            width: 1,
                          ),
                        ),
                        enabledBorder: border,
                        labelText: 'CVV',
                        hintText: 'XXX',
                      ),
                      cardHolderDecoration: InputDecoration(
                        hintStyle: const TextStyle(color: Colors.black),
                        labelStyle: const TextStyle(color: colorGrey),
                        focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: colorGreen,
                            width: 1,
                          ),
                        ),
                        enabledBorder: border,
                        labelText: 'Name on Card',
                      ),
                      onCreditCardModelChange: onCreditCardModelChange,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 10,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        Navigator.pop(context);
                      });
                    },
                    child: Container(
                      height: 50,
                      width: 146,
                      margin: const EdgeInsets.only(left: 32),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          border: Border.all(width: 1, color: colorGreen),
                          borderRadius: BorderRadius.circular(5)),
                      child: Text(
                        "CANCEL",
                        style: defaultTextStyle(
                            fontColors: colorBlack,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      if (formKey.currentState!.validate()) {
                        updateCard();
                        print("SAVED");
                      } else {
                        print('invalid!');
                      }
                    },
                    child: Container(
                      height: 50,
                      width: 146,
                      margin: const EdgeInsets.only(right: 32),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: colorGreen,
                          borderRadius: BorderRadius.circular(5)),
                      child: Text(
                        "UPDATE",
                        style: defaultTextStyle(
                            fontColors: colorWhite,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: buildMyNavBar(context),
    );
  }

  Container buildMyNavBar(BuildContext context) {
    return Container(
      height: 74,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
              splashColor: Colors.white,
              enableFeedback: false,
              onTap: () {
                setState(() {
                  pageIndex = 0;
                });
              },
              child: Container(
                width: MediaQuery.of(context).size.width / 3,
                alignment: Alignment.center,
                child: pageIndex == 0
                    ? Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text(
                            "Explore",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Container(
                            height: 3,
                            width: 7,
                            decoration: BoxDecoration(
                                color: colorBlack,
                                borderRadius: BorderRadius.circular(10)),
                          )
                        ],
                      )
                    : const Icon(Icons.home_filled),
              )),
          InkWell(
              enableFeedback: false,
              splashColor: Colors.white,
              onTap: () {
                setState(() {
                  pageIndex = 1;
                });
              },
              child: Container(
                width: MediaQuery.of(context).size.width / 3,
                alignment: Alignment.center,
                child: pageIndex == 1
                    ? Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text(
                            "Cart",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Container(
                            height: 3,
                            width: 5,
                            decoration: BoxDecoration(
                                color: colorBlack,
                                borderRadius: BorderRadius.circular(10)),
                          )
                        ],
                      )
                    : const Icon(Icons.card_travel),
              )),
          InkWell(
            enableFeedback: false,
            splashColor: Colors.white,
            onTap: () {
              setState(() {
                pageIndex = 2;
              });
            },
            child: Container(
              width: MediaQuery.of(context).size.width / 3,
              alignment: Alignment.center,
              child: pageIndex == 2
                  ? Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          "Account",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Container(
                          height: 3,
                          width: 8,
                          decoration: BoxDecoration(
                              color: colorBlack,
                              borderRadius: BorderRadius.circular(10)),
                        )
                      ],
                    )
                  : const Icon(Icons.person),
            ),
          ),
        ],
      ),
    );
  }

  void onCreditCardModelChange(CreditCardModel? creditCardModel) {
    setState(() {
      cardNumber = creditCardModel!.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = creditCardModel.cardHolderName;
      cvvCode = creditCardModel.cvvCode;
    });
  }

  updateCard() async {
    CardRepository.cardDetailUpdate(
      context: context,
      cardName: cardHolderName.toString(),
      cardNo: cardNumber.toString(),
      cvv: cvvCode.toString(),
      exp_date: expiryDate.toString(),
      cardId: cardId.toString(),
    );

    Navigator.pop(context);
    // Navigator.pushReplacement(
    //     context, MaterialPageRoute(builder: (context) => const CardsScreen()));
  }
}
