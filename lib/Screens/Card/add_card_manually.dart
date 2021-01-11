import 'package:alloy/Screens/Card/cards_screen.dart';
import 'package:credit_card/credit_card_form.dart';
import 'package:credit_card/credit_card_model.dart';
import 'package:flutter/material.dart';
import 'package:card_scanner/card_scanner.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:async';
import '../../constants.dart';

class AddCardManually extends StatefulWidget {
  @override
  _AddCardManuallyState createState() => _AddCardManuallyState();
}

class _AddCardManuallyState extends State<AddCardManually> {
  String cardNumber = "";
  String expiryDate = "";
  String cardHolderName = "";
  String cvvCode = "";
  bool isCvvFocused = false;

  CardDetails _cardDetails;

  Future<void> scanCard() async {
    var cardDetails = await CardScanner.scanCard(
        scanOptions: CardScanOptions(
          scanCardHolderName: true,
          scanCardIssuer: true,
        ));

    if (!mounted) return;
    setState(() {
      _cardDetails = cardDetails;
      cardNumber = cardDetails.cardNumber;
      expiryDate = cardDetails.expiryDate;
      cardHolderName = cardDetails.cardHolderName;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        title: Row(
          children: [
            Text(
              'Add New Card',
              style: TextStyle(
                fontSize: 25,
                color: Colors.black,
              ),
            ),
          ],
        ),
          actions: <Widget>[
            FlatButton(
                onPressed: () async {
                  var status = await Permission.camera.request();
                  if (status == PermissionStatus.granted) {
                    scanCard();
                  }
                },
                child: Text(
                  'Scan Card',
                  style: TextStyle(
                    color: kPrimaryColor,
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                  ),
                ))
          ]
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
          Container(
            margin: EdgeInsets.only(top: 10),
            width: MediaQuery.of(context).size.width * 0.9,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
//                  color: Color(cards[index].cardBackground)
                gradient: LinearGradient(
                    begin: Alignment(-1.0, -8.0),
                    end: Alignment(1.0, 8.0),
                    colors: <Color>[Color(0x00FF5F58), Color(0xFFB9352F)]
                )
            ),
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    CircleAvatar(
                      radius: 16,
                      backgroundColor: Color.fromRGBO(50, 172, 121, 1),
                      child: Icon(Icons.check,
                        color: Colors.white,
                        size: 24,
                      ),
                    ),
                    Text("VISA",
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 32,),

                Text((cardNumber != "" ? cardNumber : "**** **** **** ****"),
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 2.0,
                  ),
                ),

                SizedBox(height: 21,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("CARD HOLDERNAME",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.blue[100],
                            fontWeight: FontWeight.w700,
                            letterSpacing: 2.0,
                          ),
                        ),
                        SizedBox(height: 5,),
                        Text(cardHolderName != "" ? cardHolderName : "**** ******",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey[100],
                            fontWeight: FontWeight.w700,
                            letterSpacing: 2.0,
                          ),
                        )
                      ],
                    ),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("EXPIRES",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.blue[100],
                            fontWeight: FontWeight.w700,
                            letterSpacing: 2.0,
                          ),
                        ),
                        SizedBox(height: 5,),
                        Text(expiryDate != "" ? expiryDate : "MM/YY",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey[100],
                            fontWeight: FontWeight.w700,
                            letterSpacing: 2.0,
                          ),
                        )
                      ],
                    ),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("CVV",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.blue[100],
                            fontWeight: FontWeight.w700,
                            letterSpacing: 2.0,
                          ),
                        ),
                        SizedBox(height: 5,),
                        Text(cvvCode != "" ? cvvCode : "***",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey[100],
                            fontWeight: FontWeight.w700,
                            letterSpacing: 2.0,
                          ),
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          ),

              Container(
                child: CreditCardForm(
                  onCreditCardModelChange: onModelChange,
                ),
              ),

              SizedBox(
                height: 15,
              ),

              RaisedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return CardScreen();
                      },
                    ),
                  );
                },
                color: Color(0xFF0080FF),
                padding: EdgeInsets.only(left: 100, right: 100, top: 20, bottom: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: new Text("Proceed", style: TextStyle(
                  fontSize: 20,
                  color: Colors.white
                ),),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onModelChange(CreditCardModel model){
    setState(() {
      cardNumber = model.cardNumber;
      expiryDate = model.expiryDate;
      cardHolderName = model.cardHolderName;
      cvvCode = model.cvvCode;
      isCvvFocused = model.isCvvFocused;
    });
  }
}
