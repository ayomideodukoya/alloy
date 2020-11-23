import 'package:alloy/Screens/Login/login_screen.dart';
import 'package:alloy/Screens/Register/register_screen.dart';
import 'package:alloy/constants.dart';
import 'package:flutter/material.dart';
import 'package:alloy/Screens/Welcome/components/background.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:alloy/components/rounded_button.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "ALLOY",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 40.0,
              ),
            ),
            SizedBox(height: size.height * 0.03),
            SvgPicture.asset(
              "assets/icons/personalization.svg",
              height: size.height * 0.45,
            ),
            SizedBox(height: size.height * 0.05),
            RoundedButton(
              text: "LOGIN",
              press: () {Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context){return LoginScreen();}
                    ),
              );},
            ),
            RoundedButton(
              text: "REGISTER",
              press: () {Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context){return RegisterScreen();}
                  ),
              );},
              textColor: Colors.black,
              color: kPrimaryLightColor,
            ),
          ],
        ),
      ),
    );
  }
}
