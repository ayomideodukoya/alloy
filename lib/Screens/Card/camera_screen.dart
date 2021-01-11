import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:alloy/constants.dart';
import 'package:card_scanner/card_scanner.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:async';

class CameraScreen extends StatefulWidget {
  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  CameraController controller;
  List cameras;
  int selectedCameraIdx;
  String imagePath;
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
  void initState() {
    super.initState();
    availableCameras().then((availableCameras) {
      cameras = availableCameras;

      if (cameras.length > 0) {
        setState(() {
          selectedCameraIdx = 0;
        });

        _initCameraController(cameras[selectedCameraIdx]).then((void v) {});
      } else {
        print("No camera available");
      }
    }).catchError((err) {
      print('Error: $err.code\nError Message: $err.message');
    });
  }

  Future _initCameraController(CameraDescription cameraDescription) async {
    if (controller != null) {
      await controller.dispose();
    }

    controller = CameraController(cameraDescription, ResolutionPreset.high);

    // If the controller is updated then update the UI.
    controller.addListener(() {
      if (mounted) {
        setState(() {});
      }

      if (controller.value.hasError) {
        print('Camera error ${controller.value.errorDescription}');
      }
    });

    try {
      await controller.initialize();
    } on CameraException catch (e) {
      _showCameraException(e);
    }

    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: const Text(
          'Scan Card',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: Container(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: _cameraPreviewWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Display Camera preview.
  Widget _cameraPreviewWidget() {
    if (controller == null || !controller.value.isInitialized) {
      return const Text(
        'Loading',
        style: TextStyle(
          color: Colors.white,
          fontSize: 20.0,
          fontWeight: FontWeight.w900,
        ),
      );
    }

    return AspectRatio(
      aspectRatio: controller.value.aspectRatio,
      child: Container(
          child: Stack(children: <Widget>[
        CameraPreview(controller),

        Align(
          alignment: Alignment.center,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            padding: EdgeInsets.all(20.0),
            color: Color.fromRGBO(00, 00, 00, 0.4),
            child: Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment(0, -0.3),
                  child: Text(
                      '$_cardDetails' != 'null' ? '$_cardDetails' : 'no card'),
                ),
                Align(
                  alignment: Alignment(0, 0.9),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      child: ButtonTheme(
                        minWidth: 0.7 * MediaQuery.of(context).size.width,
                        height: 50,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: RaisedButton(
                          color: kPrimaryColor,
//                        padding: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
                          onPressed: () {},
                          child: Text(
                            'Add manually',
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment(0, 0.5),
                  child: Material(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(50.0),
                    child: InkWell(
                      child: ButtonTheme(
                        padding: EdgeInsets.all(20),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        child: RaisedButton(
                          color: kPrimaryColor,
                          onPressed: () async {
                            var status = await Permission.camera.request();
                            if (status == PermissionStatus.granted) {
                              scanCard();
                            }
                          },
                          child: Image.asset(
                            'assets/images/scan-icon-png-21.png',
                            color: Colors.grey[200],
                            width: 42.0,
                            height: 42.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment(0, 0.68),
                  child: Container(
                    child: Text(
                      'or',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        )
      ])),
    );
  }

  void _showCameraException(CameraException e) {
    String errorText = 'Error: ${e.code}\nError Message: ${e.description}';
    print(errorText);

    print('Error: ${e.code}\n${e.description}');
  }
}
