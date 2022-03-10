import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_brand.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';
import 'package:flutter_credit_card/custom_card_type_icon.dart';
import 'package:flutter_credit_card/glassmorphism_config.dart';
import 'package:untitled/modal/credit_card_model.dart';
import 'package:untitled/screens/cards%20screen/addnew_card.dart';
import 'package:untitled/screens/cards%20screen/edit_card.dart';
import '../../config/app_colors.dart';
import '../../config/FireStore_string.dart';
import '../../untils/app_fonts.dart';
import '../account screen/account_screen.dart';
import '../cart screen/cart_screen.dart';
import '../explore screen/explore_screen.dart';

class CardsScreen extends StatefulWidget {
  const CardsScreen({
    Key? key,
  }) : super(key: key);

  @override
  _CardsScreenState createState() => _CardsScreenState();
}

class _CardsScreenState extends State<CardsScreen> {
  late int id;
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;
  bool useGlassMorphism = false;
  bool useBackgroundImage = false;
  OutlineInputBorder? border;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  List<DebitCardModal> cardList = [];
  int pageIndex = 0;
  final pages = [
    const ExploreScreen(),
    const CartScreen(),
    const AccountScreen(),
  ];

  getUserCards() {
    FirebaseFirestore.instance
        .collection(FirebaseString.userCollection)
        .get()
        .then((querySnapshot) {
      querySnapshot.docs.forEach((result) {
        FirebaseFirestore.instance
            .collection(FirebaseString.userCollection)
            .doc(result.id)
            .collection(FirebaseString.cardCollection)
            .get()
            .then((querySnapshot) {
          querySnapshot.docs.forEach((result) {
            DebitCardModal debitsCardModal = DebitCardModal.fromDocs(result);
            // DebitCardModal debitsCardModal = DebitCardModal.fromJson(result.data());

            print("--------------------- Books ---------------------\n"
                "id: ${debitsCardModal.cardId}\n"
                "name: ${debitsCardModal.cardName}\n"
                "no: ${debitsCardModal.cardNo}\n"
                "cvv: ${debitsCardModal.cvv}\n"
                "expdate: ${debitsCardModal.expDate}");
          });
        });
      });
    });
  }

  final CollectionReference user = FirebaseFirestore.instance
      .collection(FirebaseString.userCollection);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserCards();
  }

  @override
  Widget build(BuildContext context) {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User? user = auth.currentUser;
    final uid = user?.uid;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => const AccountScreen()));
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios_rounded,
                    size: 18,
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 3.1,
                ),
                Text(
                  "Cards",
                  style: defaultTextStyle(
                      fontSize: 20.0, fontWeight: FontWeight.w400),
                ),
              ],
            ),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection(FirebaseString.userCollection)
                    .doc(uid)
                    .collection(FirebaseString.cardCollection)
                    .snapshots(),
                builder:
                    (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      itemCount: snapshot.data.docs.length,
                      itemBuilder: (BuildContext context, int index) {
                        DebitCardModal debitCardModal =
                            DebitCardModal.fromDocs(snapshot.data.docs[index]);
                        return InkWell(
                          onTap: () async {
                            Navigator.push(
                              context,
                              CupertinoPageRoute(
                                builder: (context) => EditCard(


                                  id: debitCardModal.cardId.toString(),
                                  cardName: debitCardModal.cardName.toString(),
                                  cvv: debitCardModal.cvv.toString(),
                                  expDate: debitCardModal.expDate.toString(),
                                  cardNumber:debitCardModal.cardNo.toString() ,
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
                        );
                      },
                    );
                  }
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
            InkWell(
              splashColor: Colors.transparent,
              onTap: () {
                Navigator.push(context,
                    CupertinoPageRoute(builder: (context) => AddCard()));
              },
              child: Container(
                height: 50,
                width: 146,
                margin: const EdgeInsets.only(left: 200, top: 10),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: colorGreen, borderRadius: BorderRadius.circular(5)),
                child: Text(
                  "NEW",
                  style: defaultTextStyle(
                      fontColors: colorWhite,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w400),
                ),
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


// getData() async {
//   List<CardModel> model = await DbHelper().getData();
//   setState(() {
//     cardList = model;
//   });
// }
}
