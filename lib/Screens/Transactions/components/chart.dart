import 'package:alloy/constants.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class TransactionChart extends StatefulWidget {
  @override
  _TransactionChartState createState() => _TransactionChartState();
}

class _TransactionChartState extends State<TransactionChart> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15),
      padding: EdgeInsets.only(right: 20,left:10, top: 23, bottom: 0),
      decoration: BoxDecoration(
        color: Color(0xff2c4260),
        borderRadius: BorderRadius.circular(20),
//        border: Border.all(color: kPrimaryColor),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 21),
            blurRadius: 53,
            color: Colors.black.withOpacity(0.05),
          ),
        ],
      ),
      child: AspectRatio(
        aspectRatio: 1.5,
        child: BarChart(
          BarChartData(
            barGroups: getBarGroups(),
            borderData: FlBorderData(show: false),
            titlesData: FlTitlesData(
              leftTitles: SideTitles(
                showTitles: true,
                interval: 5,
                getTitles: (value) {
                  if (value == 0) {
                    return '10K';
                  } else if (value == 5) {
                    return '30K';
                  } else if (value == 10) {
                    return '60k';
                  }else if (value == 15) {
                    return '90K';
                  } else {
                    return '';
                  }
                },
                margin: 15,
                getTextStyles: (value) => const TextStyle(
                  color: Color(0xFF7589A2),
                  fontSize: 14,
                  fontWeight: FontWeight.w800,
                ),
              ),
              bottomTitles: SideTitles(
                showTitles: true,
                getTitles: getWeek,
                getTextStyles: (value) => const TextStyle(
                  color: Color(0xFF7589A2),
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  getBarGroups() {
    List<double> barChartDatas = [6, 10, 8, 7, 10, 15, 9];
    List<BarChartGroupData> barChartGroups = [];
    barChartDatas.asMap().forEach(
          (i, value) => barChartGroups.add(
            BarChartGroupData(
              x: i,
              barRods: [
                BarChartRodData(
                  y: value,
                  colors: [Color(0xFF00640E), Color(0xAA2ED239)],
                  width: 10,
                ),
                BarChartRodData(
                  y: value-2,
                  colors: [Color(0xFFB9352F),Color(0xAAB9352F),],
                  width: 10,
                )
              ],
            ),
          ),
        );
    return barChartGroups;
  }

  String getWeek(double value) {
    switch (value.toInt()) {
      case 0:
        return 'MON';
      case 1:
        return 'TUE';
      case 2:
        return 'WED';
      case 3:
        return 'THU';
      case 4:
        return 'FRI';
      case 5:
        return 'SAT';
      case 6:
        return 'SUN';
      default:
        return '';
    }
  }
}
