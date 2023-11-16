import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class EarningGraph extends StatefulWidget {
  const EarningGraph({super.key, required this.barData});
  final List barData;
  @override
  State<EarningGraph> createState() => _EarningGraphState();
}

class _EarningGraphState extends State<EarningGraph> {
  @override
  Widget build(BuildContext context) {
    return BarChart(
      BarChartData(
        alignment: BarChartAlignment.spaceAround,
          maxY: 1000,
          minY: 0,
          gridData: const FlGridData(show: false),
          borderData: FlBorderData(show: false),
          titlesData: const FlTitlesData(
              leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
              rightTitles:
                  AxisTitles(sideTitles: SideTitles(showTitles: false)),
              topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
              bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                      getTitlesWidget: getBottomTiles, showTitles: true))),
          barGroups:
            widget.barData.map(
              (data) => BarChartGroupData(x: data.x, barRods: [
                BarChartRodData(
                    toY: data.y,
                    gradient: const LinearGradient(begin: Alignment.bottomCenter,colors: [Colors.white,Colors.red]),
                    width: 12,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10))),
              ]),
            ).toList(),
    ));
  }
}

Widget getBottomTiles(double value, TitleMeta meta) {
  const style = TextStyle(color: Colors.red, fontWeight: FontWeight.bold);

  Widget text;
  switch (value.toInt()) {
    case 0:
      text = const Text(
        'sun',
        style: style,
      );
      break;
    case 1:
      text = const Text(
        'mon',
        style: style,
      );
      break;
    case 2:
      text = const Text(
        'tue',
        style: style,
      );
      break;
    case 3:
      text = const Text(
        'wed',
        style: style,
      );
      break;
    case 4:
      text = const Text(
        'thu',
        style: style,
      );
      break;
    case 5:
      text = const Text(
        'fri',
        style: style,
      );
      break;
    case 6:
      text = const Text(
        'sat',
        style: style,
      );
      break;
    default:
      text = const Text(
        '',
        style: style,
      );
      break;
  }
  return SideTitleWidget(axisSide: meta.axisSide, child: text);
}
