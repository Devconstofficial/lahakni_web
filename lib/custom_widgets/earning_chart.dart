// widgets/earning_chart.dart
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lahakni_web/utils/app_colors.dart';

import '../screens/ride_booking_screen/controller/ride_booking_controller.dart';

class EarningChart extends StatelessWidget {
  final controller = Get.put(RideBookingController());

  final List<String> months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'June', 'July', 'Sep', 'Oct', 'Nov', 'Dec', 'Jan', 'Jan'];

  @override
  Widget build(BuildContext context) {
    return Obx(() => BarChart(
      BarChartData(
        barTouchData: BarTouchData(
          enabled: true,
          touchTooltipData: BarTouchTooltipData(
            getTooltipColor: (group) => kWhiteColor,
            tooltipRoundedRadius: 50,
            tooltipPadding: EdgeInsets.symmetric(vertical: 6,horizontal: 30),
            tooltipBorder: BorderSide(color: Colors.black),
            getTooltipItem: (group, groupIndex, rod, rodIndex) {
              if (groupIndex == 5) {
                return BarTooltipItem('\$500', TextStyle(color: kPrimaryColor));
              }
              return null;
            },
          ),
        ),
        titlesData: FlTitlesData(
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 42,
              getTitlesWidget: (value, meta) {
                return Text('${value.toInt()} Hr', style: TextStyle(color: Colors.grey,fontSize: 12,fontWeight: FontWeight.w400));
              },
              interval: 20,
            ),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (value, meta) {
                return Padding(
                  padding: const EdgeInsets.only(top: 6.0),
                  child: Text(months[value.toInt()], style: TextStyle(fontWeight: FontWeight.w400,fontSize: 12)),
                );
              },
            ),
          ),
          topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        ),
        gridData: FlGridData(
            show: true,
            horizontalInterval: 20,
            drawVerticalLine: false,
            drawHorizontalLine: true,
        ),
        borderData: FlBorderData(show: false),
        barGroups: controller.barData.asMap().entries.map((entry) {
          int index = entry.key;
          double earning = entry.value[0];
          double rideCharge = entry.value[1];
          double total = earning + rideCharge;

          return BarChartGroupData(
            x: index,
            barsSpace: 4,
            barRods: [
              BarChartRodData(
                toY: total,
                rodStackItems: [
                  BarChartRodStackItem(0, earning, kPrimaryColor),
                  BarChartRodStackItem(earning, total, kGreenColor.withOpacity(0.5)),
                ],
                width: 32.w,
                borderRadius: BorderRadius.circular(6),
                color: Colors.transparent,
              ),
            ],
          );
        }).toList(),
        maxY: 80,
      ),
    ));
  }
}
