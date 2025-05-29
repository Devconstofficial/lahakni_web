import 'package:fl_chart/fl_chart.dart';
import 'package:get/get.dart';

import '../../../utils/app_colors.dart';

class DashboardController extends GetxController {
  RxString selectedOption = "".obs;
  List<String> options = ["Last 7 days", "Monthly", "Yearly"];
  void selectOption(String option) {
    selectedOption.value = option;
  }

  final yInterval = 20;

  var months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul'].obs;

  var completedSpots = <FlSpot>[
    FlSpot(0, 20),
    FlSpot(1, 25),
    FlSpot(2, 60),
    FlSpot(3, 55),
    FlSpot(4, 50),
    FlSpot(5, 58),
    FlSpot(6, 70),
  ].obs;

  var pendingSpots = <FlSpot>[
    FlSpot(0, 30),
    FlSpot(1, 40),
    FlSpot(2, 70),
    FlSpot(3, 60),
    FlSpot(4, 65),
    FlSpot(5, 62),
    FlSpot(6, 75),
  ].obs;

  LineChartBarData get completedLine => LineChartBarData(
    spots: completedSpots,
    isCurved: true,
    color: kBlackColor,
    barWidth: 2,
    dotData: FlDotData(show: false),
    belowBarData: BarAreaData(show: false),
  );

  LineChartBarData get pendingLine => LineChartBarData(
    spots: pendingSpots,
    isCurved: true,
    color: kGreyColor5,
    barWidth: 2,
    dotData: FlDotData(show: false),
    belowBarData: BarAreaData(show: false),
  );

  List<LineChartBarData> get lineBars => [completedLine, pendingLine];
}