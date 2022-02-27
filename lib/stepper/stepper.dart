import 'package:flutter/material.dart';
import 'package:untitled/screens/checkout_screen/checkout_address.dart';
import 'package:untitled/screens/checkout_screen/checkout_delivery.dart';
import 'package:untitled/config/app_colors.dart';
import 'package:untitled/untils/app_fonts.dart';

class Stepper1 extends StatefulWidget {
  const Stepper1({Key? key}) : super(key: key);

  @override
  _Stepper1State createState() => _Stepper1State();
}

class _Stepper1State extends State<Stepper1> {
  int _activeCurrentStep = 0;
  bool adress = false;
  int grpValue = 1;
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController pincode = TextEditingController();

  List<Step> stepList() =>
      [
        Step(
          state: _activeCurrentStep <= 0 ? StepState.editing : StepState
              .complete,
          isActive: _activeCurrentStep >= 0,
          title: const Text('Delivery'),
          content: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: MediaQuery
                    .of(context)
                    .size
                    .height / 30,),
                Padding(
                  padding: const EdgeInsets.only(left: 16, bottom: 10),
                  child: Text(
                    "Standard Delivery",
                    style: defaultTextStyle(),
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16, right: 34),
                        child: Text(
                          "Order will be delivered between 3 - 5 business days",
                          style: defaultTextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(right: 16),
                      alignment: Alignment.topCenter,
                      child: Radio(
                          value: 1,
                          activeColor: colorGreen,
                          groupValue: grpValue,
                          onChanged: (int? value) {
                            setState(() {
                              grpValue = value!;
                            });
                          }),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery
                      .of(context)
                      .size
                      .height / 30,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16, bottom: 10),
                  child: Text(
                    "Next Day Delivery",
                    style: defaultTextStyle(),
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16, right: 34),
                        child: Text(
                          "Place your order before 6pm and your item will be deliverd at next day",
                          style: defaultTextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(right: 16),
                      alignment: Alignment.topCenter,
                      child: Radio(
                          value: 2,
                          activeColor: colorGreen,
                          groupValue: grpValue,
                          onChanged: (int? value) {
                            setState(() {
                              grpValue = value!;
                            });
                          }),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery
                      .of(context)
                      .size
                      .height / 30,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16, bottom: 10),
                  child: Text(
                    "Nominated Delivery",
                    style: defaultTextStyle(),
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16, right: 34),
                        child: Text(
                          "Pick a particular date from calender and order will be delivered on selected date",
                          style: defaultTextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(right: 16),
                      alignment: Alignment.topCenter,
                      child: Radio(
                          value: 3,
                          activeColor: colorGreen,
                          groupValue: grpValue,
                          onChanged: (int? value) {
                            setState(() {
                              grpValue = value!;
                            });
                          }),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery
                      .of(context)
                      .size
                      .height / 30,
                ),
              ],
            ),
          ),
        ),
        // This is Step2 here we will enter our address
        Step(
            state:
            _activeCurrentStep <= 1 ? StepState.editing : StepState.complete,
            isActive: _activeCurrentStep >= 1,
            title: const Text('Address'),
            content: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Transform.scale(
                        scale: 1.1,
                        child: Checkbox(
                            activeColor: colorGreen,
                            side: const BorderSide(color: colorGrey),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50)),
                            value: adress,
                            onChanged: (value) {
                              setState(() {
                                adress = !adress;
                              });
                            }),
                      ),
                      Text(
                        "Billing address is the same as delivery address",
                        style: defaultTextStyle(
                            fontSize: 14.0, fontWeight: FontWeight.w400),
                      )
                    ],
                  ),
                  Padding(
                    padding:
                    const EdgeInsets.only(left: 16, right: 16, top: 15),
                    child: Form(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: MediaQuery
                                .of(context)
                                .size
                                .height / 35,),
                            Text(
                              "Street 1",
                              style: defaultTextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w400,
                                  fontColors: colorGrey),
                            ),
                            TextFormField(
                              cursorColor: colorGrey,
                              cursorHeight: 22,
                              cursorWidth: 1.2,
                              textInputAction: TextInputAction.next,
                              style: defaultTextStyle(
                                  fontSize: 18.0, fontWeight: FontWeight.w400),
                              decoration: const InputDecoration(
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: colorGrey),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery
                                  .of(context)
                                  .size
                                  .height / 25,
                            ),
                            Text(
                              "Street 2",
                              style: defaultTextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w400,
                                  fontColors: colorGrey),
                            ),
                            TextFormField(
                              cursorColor: colorGrey,
                              cursorHeight: 22,
                              cursorWidth: 1.2,
                              textInputAction: TextInputAction.next,
                              style: defaultTextStyle(
                                  fontSize: 18.0, fontWeight: FontWeight.w400),
                              decoration: const InputDecoration(
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: colorGrey),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery
                                  .of(context)
                                  .size
                                  .height / 25,
                            ),
                            Text(
                              "City",
                              style: defaultTextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w400,
                                  fontColors: colorGrey),
                            ),
                            TextFormField(
                              cursorColor: colorGrey,
                              cursorHeight: 22,
                              cursorWidth: 1.2,
                              textInputAction: TextInputAction.next,
                              style: defaultTextStyle(
                                  fontSize: 18.0, fontWeight: FontWeight.w400),
                              decoration: const InputDecoration(
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: colorGrey),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery
                                  .of(context)
                                  .size
                                  .height / 25,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment
                                        .start,
                                    children: [
                                      Text(
                                        "State",
                                        style: defaultTextStyle(
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.w400,
                                            fontColors: colorGrey),
                                      ),
                                      TextFormField(
                                        cursorColor: colorGrey,
                                        cursorHeight: 22,
                                        cursorWidth: 1.2,
                                        textInputAction: TextInputAction.next,
                                        style: defaultTextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.w400),
                                        decoration: const InputDecoration(
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide:
                                            BorderSide(color: colorGrey),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 25),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment
                                        .start,
                                    children: [
                                      Text(
                                        "Country",
                                        style: defaultTextStyle(
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.w400,
                                            fontColors: colorGrey),
                                      ),
                                      TextFormField(
                                        cursorColor: colorGrey,
                                        cursorHeight: 22,
                                        cursorWidth: 1.2,
                                        textInputAction: TextInputAction.done,
                                        style: defaultTextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.w400),
                                        decoration: const InputDecoration(
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide:
                                            BorderSide(color: colorGrey),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )
                          ],
                        )),
                  ),
                  SizedBox(height: MediaQuery
                      .of(context)
                      .size
                      .height / 7.5,),
                  SizedBox(
                    height: MediaQuery
                        .of(context)
                        .size
                        .height / 10,
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (
                                        context) => const CheckoutDelivery()));
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
                              "BACK",
                              style: defaultTextStyle(
                                  fontColors: colorBlack,
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (
                                        context) => const CheckAddress()));
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
                              "NEXT",
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
              ),)),

        // This is Step3 here we will display all the details
        // that are entered by the user
        Step(
            state: StepState.complete,
            isActive: _activeCurrentStep >= 2,
            title: const Text('Confirm'),
            content: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Transform.scale(
                          scale: 1.1,
                          child: Checkbox(
                              activeColor: colorGreen,
                              side: const BorderSide(color: colorGrey),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50)),
                              value: adress,
                              onChanged: (value) {
                                setState(() {
                                  adress = !adress;
                                });
                              }),
                        ),
                        Text(
                          "Billing address is the same as delivery address",
                          style: defaultTextStyle(
                              fontSize: 14.0, fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                    Padding(
                      padding:
                      const EdgeInsets.only(left: 16, right: 16, top: 15),
                      child: Form(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: MediaQuery
                                  .of(context)
                                  .size
                                  .height / 35,),
                              Text(
                                "Street 1",
                                style: defaultTextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w400,
                                    fontColors: colorGrey),
                              ),
                              TextFormField(
                                cursorColor: colorGrey,
                                cursorHeight: 22,
                                cursorWidth: 1.2,
                                textInputAction: TextInputAction.next,
                                style: defaultTextStyle(
                                    fontSize: 18.0, fontWeight: FontWeight.w400),
                                decoration: const InputDecoration(
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: colorGrey),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 25,
                              ),
                              Text(
                                "Street 2",
                                style: defaultTextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w400,
                                    fontColors: colorGrey),
                              ),
                              TextFormField(
                                cursorColor: colorGrey,
                                cursorHeight: 22,
                                cursorWidth: 1.2,
                                textInputAction: TextInputAction.next,
                                style: defaultTextStyle(
                                    fontSize: 18.0, fontWeight: FontWeight.w400),
                                decoration: const InputDecoration(
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: colorGrey),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 25,
                              ),
                              Text(
                                "City",
                                style: defaultTextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w400,
                                    fontColors: colorGrey),
                              ),
                              TextFormField(
                                cursorColor: colorGrey,
                                cursorHeight: 22,
                                cursorWidth: 1.2,
                                textInputAction: TextInputAction.next,
                                style: defaultTextStyle(
                                    fontSize: 18.0, fontWeight: FontWeight.w400),
                                decoration: const InputDecoration(
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: colorGrey),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 25,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment
                                          .start,
                                      children: [
                                        Text(
                                          "State",
                                          style: defaultTextStyle(
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.w400,
                                              fontColors: colorGrey),
                                        ),
                                        TextFormField(
                                          cursorColor: colorGrey,
                                          cursorHeight: 22,
                                          cursorWidth: 1.2,
                                          textInputAction: TextInputAction.next,
                                          style: defaultTextStyle(
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.w400),
                                          decoration: const InputDecoration(
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide:
                                              BorderSide(color: colorGrey),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 25),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment
                                          .start,
                                      children: [
                                        Text(
                                          "Country",
                                          style: defaultTextStyle(
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.w400,
                                              fontColors: colorGrey),
                                        ),
                                        TextFormField(
                                          cursorColor: colorGrey,
                                          cursorHeight: 22,
                                          cursorWidth: 1.2,
                                          textInputAction: TextInputAction.done,
                                          style: defaultTextStyle(
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.w400),
                                          decoration: const InputDecoration(
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide:
                                              BorderSide(color: colorGrey),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              )
                            ],
                          )),
                    ),
                    SizedBox(height: MediaQuery
                        .of(context)
                        .size
                        .height / 7.5,),
                    SizedBox(
                      height: MediaQuery
                          .of(context)
                          .size
                          .height / 10,
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (
                                          context) => const CheckoutDelivery()));
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
                                "BACK",
                                style: defaultTextStyle(
                                    fontColors: colorBlack,
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (
                                          context) => const CheckAddress()));
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
                                "NEXT",
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
                ),),),
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.green,
        title: const Text(
          'GeeksforGeeks', style: TextStyle(color: Colors.white),),
      ),
      // Here we have initialized the stepper widget
      body: Stepper(
        elevation: 0.0,
        type: StepperType.horizontal,
        currentStep: _activeCurrentStep,
        steps: stepList(),
        // onStepContinue takes us to the next step
        onStepContinue: () {
          if (_activeCurrentStep < (stepList().length - 1)) {
            setState(() {
              _activeCurrentStep += 1;
            });
          }
        },

        // onStepCancel takes us to the previous step
        onStepCancel: () {
          if (_activeCurrentStep == 0) {
            return;
          }

          setState(() {
            _activeCurrentStep -= 1;
          });
        },

        // onStepTap allows to directly click on the particular step we want
        onStepTapped: (int index) {
          setState(() {
            _activeCurrentStep = index;
          });
        },
      ),
    );;
  }
}
