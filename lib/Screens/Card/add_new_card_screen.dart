import 'package:flutter/material.dart';
import 'package:card_scanner/card_scanner.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:async';

class AddNewCardScreen extends StatefulWidget {
  @override
  _AddNewCardScreenState createState() => _AddNewCardScreenState();
}

class _AddNewCardScreenState extends State<AddNewCardScreen>
    with AutomaticKeepAliveClientMixin {
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
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('card_scanner app'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              RaisedButton(
                onPressed: () async {
                  var status = await Permission.camera.request();
                  if (status == PermissionStatus.granted) {
                    scanCard();
                  }
                },
                child: Text('scan card'),
              ),
              Text('$_cardDetails' != 'null' ? '$_cardDetails' : '')
            ],
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
