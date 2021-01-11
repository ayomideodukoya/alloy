import 'package:flutter/material.dart';

class TransactionsGrid extends StatefulWidget {
  @override
  _TransactionsGridState createState() => _TransactionsGridState();
}

class _TransactionsGridState extends State<TransactionsGrid> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.25,
      child: Column(
        children: <Widget>[
          Flexible(
            child: Row(
              children: <Widget>[
                _buildStatCard('Credits', 'N 1,060,896.00', Color(0x772ED239), Color(0xDD00640E)),
                _buildStatCard('Expenses', 'N 580,000.00', Color(0x44B9352F),Color(0xFFd41911)),
              ],
            ),
          ),
          Flexible(
            child: Row(
              children: <Widget>[
                _buildStatCard('Subscriptions', 'N 80,600.00', Color(0x77F3CA3E), Color(0xFF977500)),
                _buildStatCard('Bills', 'N 65,600.00', Color(0x779ACBFD), Color(0xFF0337EE)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Expanded _buildStatCard(String title, String count, startColor, endColor) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(8.0),
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment(-1.0, -8.0),
              end: Alignment(1.0, 8.0),
              colors: <Color>[startColor, endColor]
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              count,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
