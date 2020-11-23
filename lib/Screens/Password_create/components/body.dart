import 'package:alloy/Screens/Home/home_screen.dart';
import 'package:alloy/components/rounded_password_field.dart';
import 'package:flutter/material.dart';
import 'package:alloy/Screens/Login/login_screen.dart';
import 'package:alloy/Screens/Register/components/background.dart';
import 'package:alloy/components/already_have_an_account_acheck.dart';
import 'package:alloy/components/rounded_button.dart';
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
              "CREATE PASSWORD",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0, 
              ),
            ),
            SizedBox(height: size.height * 0.03),
            SvgPicture.asset(
              "assets/icons/register2.svg",
              height: size.height * 0.35,
              
            ),
            
            RoundedPasswordField(
              onChanged: (value) {},
            ),
            RoundedButton(
              text: "Register",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context){
                      
                      return HomeScreen();
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
