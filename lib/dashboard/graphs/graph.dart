import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class GraphWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(),
          ],
        ),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                const Color.fromARGB(255, 212, 233, 238),
                const Color.fromARGB(255, 255, 255, 255)
              ],
            ),
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Container(
            child: Container(
              margin: EdgeInsets.only(top: 6),
              height: 180,
              padding: EdgeInsets.only(
                left: 16,
                right: 16,
                top: 16,
              ),
              child: BarChart(
                BarChartData(
                  // alignment: BarChartAlignment.center,
                  maxY: 100,
                  barGroups: [
                    BarChartGroupData(
                      x: 0,
                      barRods: [
                        BarChartRodData(
                          toY: 60,
                          color: const Color.fromARGB(255, 10, 24, 94),
                          width: 23,
                          borderRadius: BorderRadius.circular(3),
                        ),
                      ],
                    ),
                    BarChartGroupData(
                      x: 1,
                      barRods: [
                        BarChartRodData(
                          toY: 80,
                          color: const Color.fromARGB(255, 100, 102, 102),
                          width: 23,
                          borderRadius: BorderRadius.circular(3),
                        ),
                      ],
                    ),
                    BarChartGroupData(
                      x: 2,
                      barRods: [
                        BarChartRodData(
                          toY: 45,
                          color: Colors.blue,
                          width: 23,
                          borderRadius: BorderRadius.circular(3),
                        ),
                      ],
                    ),
                  ],
                  titlesData: FlTitlesData(
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 30,
                        getTitlesWidget: (double value, TitleMeta meta) {
                          const style = TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            fontFamily: "LexendDecaRegular",
                          );
                          Widget text;
                          switch (value.toInt()) {
                            case 0:
                              text = Text('Earned', style: style);
                              break;
                            case 1:
                              text = Text('Payment', style: style);
                              break;
                            case 2:
                              text = Text('  Completed', style: style);
                              break;
                            default:
                              text = Text('', style: style);
                          }
                          return text;
                        },
                      ),
                    ),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        interval: 20,
                        getTitlesWidget: (double value, TitleMeta meta) {
                          return Text(
                            value.toInt().toString(),
                            style: TextStyle(fontSize: 10),
                          );
                        },
                      ),
                    ),
                    topTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    rightTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                  ),
                  gridData: FlGridData(show: false),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
