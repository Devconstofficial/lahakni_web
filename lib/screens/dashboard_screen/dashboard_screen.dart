import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_images.dart';
import '../../../utils/app_styles.dart';
import '../../custom_widgets/custom_textfield.dart';
import '../notifications/controller/notification_controller.dart';
import '../notifications/notification_screen.dart';
import '../sidemenu/sidemenu.dart';
import 'controller/dashboard_controller.dart';
import 'package:fl_chart/fl_chart.dart' as fl;

class DashboardScreen extends GetView<DashboardController> {
  DashboardScreen({super.key});
  final NotificationController notificationController = Get.put(NotificationController());

  statusRow(text, Color color) {
    return Row(
      children: [
        CircleAvatar(radius: 4, backgroundColor: color),
        SizedBox(width: 8.w),
        Text(
          text,
          style: AppStyles.blackTextStyle().copyWith(
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () {
        // CommonCode.unFocus(context);
      },
      child: Scaffold(
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SideMenu(),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: 50.0.w,
                          top: 36.h,
                          right: 50.w,
                          bottom: 36.h,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Dashboard",
                                  style: AppStyles.semiBoldGilroyTextStyle()
                                      .copyWith(
                                        fontSize: 32.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                ),
                                Spacer(),
                                customContainer(kNotiIcon, () {
                                  notificationController.showNotification.value = true;
                                }),
                                SizedBox(width: 9.w),
                                customContainer(kSettingsIcon, () {}),
                                SizedBox(width: 21.w),
                                Container(
                                  height: 60,
                                  width: 60,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    border: Border.all(color: kBlackColor),
                                  ),
                                  child: Image.asset(
                                    kPersonImage,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(width: 5.w),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Kaleemullah",
                                      style: AppStyles.blackTextStyle()
                                          .copyWith(
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w400,
                                          ),
                                    ),
                                    Text(
                                      "Admin",
                                      style: AppStyles.blackTextStyle()
                                          .copyWith(
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w400,
                                          ),
                                    ),
                                  ],
                                ),
                                SizedBox(width: 21.w),
                              ],
                            ),
                            SizedBox(height: 28),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: kGreyColor3),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  insightContainer(
                                    "89,935",
                                    "Total users ",
                                    kDoubleUsersIcon,
                                    kArrowUpIcon,
                                    "10.2",
                                    "+1.01",
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 18.0,
                                    ),
                                    child: Container(
                                      height: 95,
                                      width: 1,
                                      color: kGreyColor4,
                                    ),
                                  ),
                                  insightContainer(
                                    "23,283.5",
                                    "Total Rides",
                                    kCar2Icon,
                                    kArrowUpIcon,
                                    "3.1",
                                    "+0.49",
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 18.0,
                                    ),
                                    child: Container(
                                      height: 95,
                                      width: 1,
                                      color: kGreyColor4,
                                    ),
                                  ),
                                  insightContainer(
                                    "46,827",
                                    "Total Drivers",
                                    kCheckIcon,
                                    kArrowDownIcon,
                                    "2.56",
                                    "-0.91",
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 28),
                            Container(
                              width: width,
                              decoration: BoxDecoration(
                                border: Border.all(color: kGreyColor3),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(20),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          "Bookings",
                                          style:
                                              AppStyles.semiBoldGilroyTextStyle()
                                                  .copyWith(
                                                    fontSize: 20.sp,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                        ),
                                        Spacer(),
                                        statusRow("Completed", kGreenColor),
                                        SizedBox(width: 20.w),
                                        statusRow("Pending", kOrangeColor),
                                        SizedBox(width: 20.w),
                                        Obx(
                                          () => Container(
                                            height: 44,
                                            decoration: BoxDecoration(
                                              color: kWhiteColor,
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: kGreyColor4
                                                      .withOpacity(0.12),
                                                  blurRadius: 10,
                                                  spreadRadius: 0,
                                                  offset: Offset(0, 2),
                                                ),
                                              ],
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                left: 12.0,
                                              ),
                                              child: Row(
                                                children: [
                                                  Text(
                                                    controller
                                                            .selectedOption
                                                            .value
                                                            .isEmpty
                                                        ? "Last 7 Days"
                                                        : controller
                                                            .selectedOption
                                                            .value,
                                                    style:
                                                        AppStyles.blackTextStyle()
                                                            .copyWith(
                                                              fontSize: 14.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                            ),
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                  PopupMenuButton<String>(
                                                    color: kWhiteColor,
                                                    padding: EdgeInsets.all(0),
                                                    position:
                                                        PopupMenuPosition.under,
                                                    shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            12,
                                                          ),
                                                      side: BorderSide(
                                                        color: kGreyColor3,
                                                      ),
                                                    ),
                                                    onSelected: (value) {},
                                                    itemBuilder: (
                                                      BuildContext context,
                                                    ) {
                                                      return controller.options.map((
                                                        option,
                                                      ) {
                                                        return PopupMenuItem<
                                                          String
                                                        >(
                                                          value: option,
                                                          child: InkWell(
                                                            onTap: () {
                                                              controller
                                                                  .selectOption(
                                                                    option,
                                                                  );
                                                              Navigator.pop(
                                                                context,
                                                              );
                                                            },
                                                            child: Text(
                                                              option,
                                                              style: AppStyles.blackTextStyle()
                                                                  .copyWith(
                                                                    fontSize:
                                                                        12.sp,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                  ),
                                                            ),
                                                          ),
                                                        );
                                                      }).toList();
                                                    },
                                                    icon: const Icon(
                                                      Icons
                                                          .keyboard_arrow_down_outlined,
                                                      size: 16,
                                                      color: kGreyColor4,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 24),
                                    Obx(
                                      () => SizedBox(
                                        height: 250,
                                        child: LineChart(
                                          LineChartData(
                                            gridData: FlGridData(
                                              show: true,
                                              drawVerticalLine: false,
                                              getDrawingHorizontalLine:
                                                  (value) => FlLine(
                                                    color: Colors.grey.shade300,
                                                    strokeWidth: 1,
                                                  ),
                                            ),
                                            titlesData: FlTitlesData(
                                              bottomTitles: AxisTitles(
                                                sideTitles: SideTitles(
                                                  showTitles: true,
                                                  interval: 1,
                                                  getTitlesWidget: (
                                                    value,
                                                    meta,
                                                  ) {
                                                    if (value.toInt() <
                                                        controller
                                                            .months
                                                            .length) {
                                                      return Text(
                                                        controller.months[value
                                                            .toInt()],
                                                        style:
                                                            AppStyles.regularGilroyTextStyle()
                                                                .copyWith(
                                                                  fontSize:
                                                                      14.sp,
                                                                  color:
                                                                      kGreyColor4,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                ),
                                                      );
                                                    }
                                                    return const SizedBox.shrink();
                                                  },
                                                ),
                                              ),
                                              leftTitles: AxisTitles(
                                                sideTitles: SideTitles(
                                                  showTitles: true,
                                                  interval: 20,
                                                  getTitlesWidget:
                                                      (value, meta) => Text(
                                                        value
                                                            .toInt()
                                                            .toString(),
                                                        style:
                                                            AppStyles.regularGilroyTextStyle()
                                                                .copyWith(
                                                                  fontSize:
                                                                      14.sp,
                                                                  color:
                                                                      kGreyColor4,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                ),
                                                      ),
                                                ),
                                              ),
                                              topTitles: AxisTitles(
                                                sideTitles: SideTitles(
                                                  showTitles: false,
                                                ),
                                              ),
                                              rightTitles: AxisTitles(
                                                sideTitles: SideTitles(
                                                  showTitles: false,
                                                ),
                                              ),
                                            ),
                                            borderData: FlBorderData(
                                              show: false,
                                            ),
                                            minX: 0,
                                            maxX:
                                                controller.months.length
                                                    .toDouble() -
                                                1,
                                            minY: 0,
                                            maxY: 100,
                                            lineBarsData: [
                                              LineChartBarData(
                                                spots:
                                                    controller.completedSpots,
                                                isCurved: true,
                                                color: kGreenColor,
                                                barWidth: 2,
                                                dotData: FlDotData(show: false),
                                                belowBarData: BarAreaData(
                                                  show: false,
                                                ),
                                              ),
                                              LineChartBarData(
                                                spots: controller.pendingSpots,
                                                isCurved: true,
                                                color: kOrangeColor,
                                                barWidth: 2,
                                                dotData: FlDotData(show: false),
                                                belowBarData: BarAreaData(
                                                  show: false,
                                                ),
                                              ),
                                            ],
                                            lineTouchData: LineTouchData(
                                              handleBuiltInTouches: true,
                                              touchCallback:
                                                  (
                                                    FlTouchEvent event,
                                                    LineTouchResponse? response,
                                                  ) {},
                                              touchTooltipData: LineTouchTooltipData(
                                                tooltipRoundedRadius: 8,
                                                fitInsideHorizontally: true,
                                                fitInsideVertically: true,
                                                getTooltipColor:
                                                    (touchedSpots) =>
                                                        kWhiteColor,
                                                getTooltipItems: (
                                                  touchedSpots,
                                                ) {
                                                  return touchedSpots.map((
                                                    spot,
                                                  ) {
                                                    if (spot.barIndex == 0) {
                                                      final date =
                                                          controller.months[spot
                                                              .x
                                                              .toInt()];
                                                      final value = spot.y
                                                          .toStringAsFixed(2);
                                                      return LineTooltipItem(
                                                        '$date\n$value',
                                                        const TextStyle(
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 12,
                                                        ),
                                                      );
                                                    }
                                                    return null; // Important: return null to keep length consistent
                                                  }).toList();
                                                },
                                              ),
                                              getTouchedSpotIndicator: (
                                                barData,
                                                spotIndexes,
                                              ) {
                                                if (barData.color ==
                                                    kGreenColor) {
                                                  return spotIndexes.map((
                                                    index,
                                                  ) {
                                                    return TouchedSpotIndicatorData(
                                                      FlLine(
                                                        color: kGreenColor,
                                                        strokeWidth: 2,
                                                      ),
                                                      FlDotData(
                                                        show: true,
                                                        getDotPainter:
                                                            (
                                                              spot,
                                                              percent,
                                                              barData,
                                                              index,
                                                            ) => FlDotCirclePainter(
                                                              radius: 6,
                                                              color:
                                                                  kGreenColor,
                                                              strokeWidth: 2,
                                                              strokeColor:
                                                                  Colors.white,
                                                            ),
                                                      ),
                                                    );
                                                  }).toList();
                                                }
                                                return spotIndexes.map((_) {
                                                  return TouchedSpotIndicatorData(
                                                    FlLine(
                                                      color: Colors.transparent,
                                                    ),
                                                    FlDotData(show: false),
                                                  );
                                                }).toList();
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 41),
                            Container(
                              width: width,
                              decoration: BoxDecoration(
                                border: Border.all(color: kGreyColor3),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(20),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          "Account Request",
                                          style:
                                              AppStyles.semiBoldGilroyTextStyle()
                                                  .copyWith(
                                                    fontSize: 20.sp,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                        ),
                                        Spacer(),
                                        SizedBox(
                                          height: 44,
                                          width: 357,
                                          child: CustomTextField(
                                            hintText: "Search here...",
                                            // width: 357.w,
                                            prefix: Padding(
                                              padding: const EdgeInsets.all(
                                                12.0,
                                              ),
                                              child: SvgPicture.asset(
                                                kSearchIcon,
                                              ),
                                            ),
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                  vertical: 6,
                                                  horizontal: 10,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 24),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Obx(() => NotificationPanel(
                show: notificationController.showNotification.value,
                onClose: () => notificationController.showNotification.value = false,
                notifications: notificationController.notifications,
              )),
            ],
          ),
        ),
      ),
    );
  }

  customContainer(image, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50,
        width: 53,
        decoration: BoxDecoration(
          color: kWhiteColor,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: kBlackColor.withOpacity(0.2)),
          boxShadow: [
            BoxShadow(
              color: kBlackColor.withOpacity(0.2),
              blurRadius: 2,
              spreadRadius: 0,
              offset: Offset(0, 0),
            ),
          ],
        ),
        child: Center(
          child: SvgPicture.asset(image, height: 24.h, width: 24.w),
        ),
      ),
    );
  }

  insightContainer(
    String insights,
    String title,
    String image,
    String arrowIcon,
    String value,
    String percent,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 12,
        children: [
          SizedBox(
            width: 198,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 6,
                  children: [
                    Text(
                      insights,
                      style: AppStyles.semiBoldGilroyTextStyle().copyWith(
                        fontSize: 28.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      title,
                      style: AppStyles.regularGilroyTextStyle().copyWith(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 44,
                  width: 44,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: kWhiteColor,
                    boxShadow: [
                      BoxShadow(
                        color: kBlackColor.withOpacity(0.1),
                        blurRadius: 10,
                        spreadRadius: 0,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Center(
                    child: SvgPicture.asset(image, height: 24, width: 24),
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              SvgPicture.asset(arrowIcon, height: 20, width: 20),
              SizedBox(width: 8),
              Text(
                value,
                style: AppStyles.regularGilroyTextStyle().copyWith(
                  fontSize: 14.sp,
                  color: kGreyColor4,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(width: 12),
              Text(
                "${percent}% this week",
                style: AppStyles.regularGilroyTextStyle().copyWith(
                  fontSize: 14.sp,
                  color: kGreyColor4,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
