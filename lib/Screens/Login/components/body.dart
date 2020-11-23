import 'package:alloy/Screens/Home/home_screen.dart';
import 'package:alloy/Screens/Register/register_screen.dart';
import 'package:alloy/Screens/Welcome/welcome_screen.dart';
import 'package:alloy/components/already_have_an_account_acheck.dart';
import 'package:alloy/components/rounded_button.dart';
import 'package:alloy/components/rounded_input_mail.dart';
import 'package:alloy/components/rounded_password_field.dart';
import 'package:alloy/components/text_field_container.dart';
import 'package:alloy/constants.dart';
import 'package:flutter/material.dart';
import 'package:alloy/Screens/Login/components/background.dart';
import 'package:flutter_svg/svg.dart';
import 'package:alloy/components/rounded_input_field.dart';

class Body extends StatelessWidget {
  const Body({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back,
                    color: Colors.black,
                  ),
                  onPressed: () {Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context){return WelcomeScreen();}
                    ),
                  );},
                  ),
                SizedBox(width: size.width * 0.05,),
                Text(
                  "LOGIN",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30.0,
                  ),
                ),
                SizedBox(width: size.width * 0.35,),
              ],
            ),
            SizedBox(height: size.height * 0.05,),
            SvgPicture.asset(
              "assets/icons/wallet.svg",
              height: size.height * 0.25,
            ),
            SizedBox(height: size.height * 0.03,),
            RoundedInputMailField(
              hintText: "Your Email",
              onChanged: (value) {},
            ),
            RoundedPasswordField(
              onChanged: (value) {},
            ),
            RoundedButton(
              text: "LOGIN",
              press: () {Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context){return HomeScreen();}
                ),
              );},
            ),
            SizedBox(height: size.height * 0.03,),
            AlreadyHaveAnAccountCheck(
              login: true,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context){
                      return RegisterScreen();
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
