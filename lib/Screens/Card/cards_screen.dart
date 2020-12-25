import 'package:alloy/Screens/Card/camera_screen.dart';
import 'package:alloy/constants.dart';
import 'package:alloy/models/card_model.dart';
import 'package:flutter/material.dart';
import 'add_new_card_screen.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class CardScreen extends StatefulWidget {
  @override
  _CardScreenState createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          title: Row(
            children: [
              SizedBox(
                width: 10,
              ),
              Text(
                'My Cards',
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          actions: <Widget>[
            FlatButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return CameraScreen();
                      },
                    ),
                  );
                },
                child: Text(
                  'Add Card',
                  style: TextStyle(
                    color: kPrimaryColor,
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                  ),
                ))
          ],
          backgroundColor: Color(0xFFFFFFFF),
        ),
        body: Container(
          padding: EdgeInsets.only(bottom: 10),
          child: ListView(
            children: <Widget>[
              SizedBox(
                height: 25,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 24),
                height: (cards.length * 190).toDouble(),
                child: new StaggeredGridView.countBuilder(
                  physics: NeverScrollableScrollPhysics(),
                  crossAxisCount: 4,
                  itemCount: cards.length,
                  itemBuilder: (BuildContext context, int index) => Container(
                    width: 310,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
//                        color: Color(cards[index].cardBackground)
                        gradient: LinearGradient(
                            begin: Alignment(-1.0, -8.0),
                            end: Alignment(1.0, 8.0),
                            colors: <Color>[
                              Color(cards[index].cardBackground1),
                              Color(cards[index].cardBackground2)
                            ])),
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
                              child: Icon(
                                Icons.check,
                                color: Colors.white,
                                size: 24,
                              ),
                            ),
                            Text(
                              "VISA",
                              style: TextStyle(
                                fontStyle: FontStyle.italic,
                                fontSize: 24,
                                color: Colors.white,
                                fontWeight: FontWeight.w900,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 32,
                        ),
                        Text(
                          cards[index].cardNumber,
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 2.0,
                          ),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "CARD HOLDERNAME",
                                  style: TextStyle(
                                    fontSize: 9,
                                    color: Colors.blue[100],
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: 2.0,
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  cards[index].user,
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
                                Text(
                                  "EXPIRES",
                                  style: TextStyle(
                                    fontSize: 9,
                                    color: Colors.blue[100],
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: 2.0,
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  cards[index].cardExpired,
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
                                Text(
                                  "CVV",
                                  style: TextStyle(
                                    fontSize: 9,
                                    color: Colors.blue[100],
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: 2.0,
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  cards[index].CVV,
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
                  staggeredTileBuilder: (int index) =>
                      new StaggeredTile.count(4, 2),
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing: 8.0,
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                alignment: Alignment.center,
                height: 100,
                decoration: BoxDecoration(
                    border: Border.all(width: 2),
                    borderRadius: BorderRadius.all(
                        Radius.circular(10.0) //         <--- border radius here
                        )),
                margin: EdgeInsets.symmetric(horizontal: 110),
                child: FlatButton(
                  color: Colors.transparent,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return CameraScreen();
                        },
                      ),
                    );
                  },
                  child: Container(
                    height: 100,
                    alignment: Alignment.center,
                    child: Text('Add new card'),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
