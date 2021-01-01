import 'package:flutter/material.dart';

class SingleCardScreen extends StatefulWidget {
  @override
  _SingleCardScreenState createState() => _SingleCardScreenState();
}

class _SingleCardScreenState extends State<SingleCardScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_rounded, color: Colors.black,size: 28,),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.white,
        title: Text(
          'Card Details',
          style: TextStyle(
            fontSize: 25,
            color: Colors.black,
          ),
        ),
      ),
      body: SafeArea(
        child:  Container(
          margin: EdgeInsets.only(top: 15),
          alignment: Alignment.topCenter,
          child: Container(
            height: 175,
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

                Text("**** **** **** ****",
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
                        Text("**** ******",
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
                        Text("MM/YY",
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
                        Text("***",
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
        ),

      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
