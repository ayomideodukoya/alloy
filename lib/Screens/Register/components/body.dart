import 'package:alloy/Screens/Password_create/password_create.dart';
import 'package:alloy/components/rounded_input_mail.dart';
import 'package:alloy/components/rounded_inputnumber_field.dart';
import 'package:flutter/material.dart';
import 'package:alloy/Screens/Login/login_screen.dart';
import 'package:alloy/Screens/Register/components/background.dart';
import 'package:alloy/components/already_have_an_account_acheck.dart';
import 'package:alloy/components/rounded_button.dart';
import 'package:alloy/components/rounded_input_field.dart';
import 'package:flutter_svg/svg.dart';

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
              "JOIN US AT ALLOY",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0, 
              ),
            ),
            SizedBox(height: size.height * 0.03),
            SvgPicture.asset(
              "assets/icons/register1.svg",
              height: size.height * 0.25,
            ),
            RoundedInputField(
              hintText: "Full Name",
              onChanged: (value) {},
            ),
            RoundedInputMailField(
              hintText: "Email",
              onChanged: (value) {},
            ),
             RoundedInputPhoneField(
              hintText: "Phone Number",
              onChanged: (value) {},
            ),
            RoundedButton(
              text: "Next",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context){
                      return PasswordAuthScreen();
                    },
                  ),
                );
              },
            ),
            
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              login: false,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    },
                  ),
                );
              },
            ),
            
            
          ],
        ),
      ),
    );
  }
}
