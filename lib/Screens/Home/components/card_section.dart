import 'package:alloy/Screens/Card/single_card_screen.dart';
import 'package:alloy/models/card_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:alloy/constants.dart';

class CardSection extends StatefulWidget {
  @override
  _CardSectionState createState() => _CardSectionState();
}

class _CardSectionState extends State<CardSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 175,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.only(left: 16, right: 6),
          itemCount: cards.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SingleCardScreen();
                    },
                  ),
                );
              },
              child: Container(
                width: 310,
                margin: EdgeInsets.only(right: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
//                  color: Color(cards[index].cardBackground)
                    gradient: LinearGradient(
                        begin: Alignment(-1.0, -8.0),
                        end: Alignment(1.0, 8.0),
                        colors: <Color>[Color(cards[index].cardBackground1), Color(cards[index].cardBackground2)]
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

                    Text(cards[index].cardNumber,
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
                                fontSize: 9,
                                color: Colors.blue[100],
                                fontWeight: FontWeight.w700,
                                letterSpacing: 2.0,
                              ),
                            ),
                            SizedBox(height: 5,),
                            Text(cards[index].user,
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
                                fontSize: 9,
                                color: Colors.blue[100],
                                fontWeight: FontWeight.w700,
                                letterSpacing: 2.0,
                              ),
                            ),
                            SizedBox(height: 5,),
                            Text(cards[index].cardExpired,
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
                                fontSize: 9,
                                color: Colors.blue[100],
                                fontWeight: FontWeight.w700,
                                letterSpacing: 2.0,
                              ),
                            ),
                            SizedBox(height: 5,),
                            Text(cards[index].CVV,
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
            );
          }),
    );
  }
}
