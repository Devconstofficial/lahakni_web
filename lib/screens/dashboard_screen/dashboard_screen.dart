import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lahakni_web/custom_widgets/custom_appBar_row.dart';
import 'package:lahakni_web/custom_widgets/custom_error_widget.dart';
import 'package:lahakni_web/custom_widgets/user_card.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_images.dart';
import '../../../utils/app_styles.dart';
import '../../custom_widgets/custom_pagination.dart';
import '../../custom_widgets/custom_textfield.dart';
import '../../utils/app_strings.dart';
import '../sidemenu/sidemenu.dart';
import 'controller/dashboard_controller.dart';

class DashboardScreen extends GetView<DashboardController> {
  const DashboardScreen({super.key});

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
                          left: 40.0.w,
                          top: 36.h,
                          right: 40.w,
                          bottom: 36.h,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomAppbarRow(title: "Dashboard"),
                            SizedBox(height: 28),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: kGreyColor3),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Obx(
                                    () => insightContainer(
                                      controller.totalUsers.value,
                                      "Total users ",
                                      kDoubleUsersIcon,
                                    ),
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
                                  Obx(
                                    () => insightContainer(
                                      controller.totalRides.value,
                                      "Total Rides",
                                      kCar2Icon,
                                    ),
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
                                  Obx(
                                    () => insightContainer(
                                      controller.totalDrivers.value,
                                      "Total Drivers",
                                      kCheckIcon,
                                    ),
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
                                        statusRow("Canceled", kOrangeColor),
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
                                                        ? "Montly"
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
                                                          onTap: () {
                                                            controller
                                                                .selectOption(
                                                                  option,
                                                                );
                                                          },
                                                          value: option,
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
                                        height: 280,
                                        child:
                                            controller.isLoading2.value
                                                ? Center(
                                                  child:
                                                      CircularProgressIndicator(),
                                                )
                                                : controller.isError2.value
                                                ? CustomErrorWidget(
                                                  title:
                                                      controller
                                                          .errorMsg2
                                                          .value,
                                                  onTap: () {
                                                    controller.getRideStats();
                                                  },
                                                )
                                                : controller.pagedUsers.isEmpty
                                                ? Center(
                                                  child: Text(
                                                    "No data",
                                                    style:
                                                        AppStyles.blackTextStyle()
                                                            .copyWith(
                                                              fontSize: 15.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                            ),
                                                  ),
                                                )
                                                : LineChart(
                                                  LineChartData(
                                                    gridData: FlGridData(
                                                      show: true,
                                                      drawVerticalLine: false,
                                                      getDrawingHorizontalLine:
                                                          (value) => FlLine(
                                                            color:
                                                                Colors
                                                                    .grey
                                                                    .shade300,
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
                                                                controller
                                                                    .months[value
                                                                    .toInt()],
                                                                style: AppStyles.regularGilroyTextStyle().copyWith(
                                                                  fontSize:
                                                                      13.sp,
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
                                                          interval: 10,
                                                          reservedSize: 40,
                                                          getTitlesWidget:
                                                              (
                                                                value,
                                                                meta,
                                                              ) => Text(
                                                                value
                                                                    .toInt()
                                                                    .toString(),
                                                                style: AppStyles.regularGilroyTextStyle().copyWith(
                                                                  fontSize:
                                                                      13.sp,
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
                                                            controller
                                                                .completedSpots,
                                                        isCurved: true,
                                                        color: kGreenColor,
                                                        barWidth: 2,
                                                        dotData: FlDotData(
                                                          show: false,
                                                        ),
                                                        belowBarData:
                                                            BarAreaData(
                                                              show: false,
                                                            ),
                                                      ),
                                                      LineChartBarData(
                                                        spots:
                                                            controller
                                                                .pendingSpots,
                                                        isCurved: true,
                                                        color: kOrangeColor,
                                                        barWidth: 2,
                                                        dotData: FlDotData(
                                                          show: false,
                                                        ),
                                                        belowBarData:
                                                            BarAreaData(
                                                              show: false,
                                                            ),
                                                      ),
                                                    ],
                                                    lineTouchData: LineTouchData(
                                                      handleBuiltInTouches:
                                                          true,
                                                      touchCallback:
                                                          (
                                                            FlTouchEvent event,
                                                            LineTouchResponse?
                                                            response,
                                                          ) {},
                                                      touchTooltipData: LineTouchTooltipData(
                                                        tooltipRoundedRadius: 8,
                                                        fitInsideHorizontally:
                                                            true,
                                                        fitInsideVertically:
                                                            true,
                                                        getTooltipColor:
                                                            (touchedSpots) =>
                                                                kWhiteColor,
                                                        getTooltipItems: (
                                                          touchedSpots,
                                                        ) {
                                                          return touchedSpots.map((
                                                            spot,
                                                          ) {
                                                            if (spot.barIndex ==
                                                                0) {
                                                              final date =
                                                                  controller
                                                                      .months[spot
                                                                      .x
                                                                      .toInt()];
                                                              final value = spot
                                                                  .y
                                                                  .toStringAsFixed(
                                                                    2,
                                                                  );
                                                              return LineTooltipItem(
                                                                '$date\n$value',
                                                                const TextStyle(
                                                                  color:
                                                                      Colors
                                                                          .black,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
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
                                                                color:
                                                                    kGreenColor,
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
                                                                      strokeWidth:
                                                                          2,
                                                                      strokeColor:
                                                                          Colors
                                                                              .white,
                                                                    ),
                                                              ),
                                                            );
                                                          }).toList();
                                                        }
                                                        return spotIndexes.map((
                                                          _,
                                                        ) {
                                                          return TouchedSpotIndicatorData(
                                                            FlLine(
                                                              color:
                                                                  Colors
                                                                      .transparent,
                                                            ),
                                                            FlDotData(
                                                              show: false,
                                                            ),
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          "Active Drivers",
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
                                            onChanged: (value) {
                                              controller.searchDrivers(value);
                                            },
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
                                    Obx(() {
                                      if (controller.isLoading.value) {
                                        return Center(
                                          child: CircularProgressIndicator(),
                                        );
                                      } else if (controller.isError.value) {
                                        return CustomErrorWidget(
                                          title: controller.errorMsg.value,
                                          onTap: () {
                                            controller.getActiveDrivers();
                                          },
                                        );
                                      } else if (controller
                                          .pagedUsers
                                          .isEmpty) {
                                        return Center(
                                          child: Text(
                                            "No active drivers",
                                            style: AppStyles.blackTextStyle()
                                                .copyWith(
                                                  fontSize: 15.sp,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                          ),
                                        );
                                      }

                                      final driver = controller.pagedUsers;

                                      return Column(
                                        children: [
                                          GridView.builder(
                                            shrinkWrap: true,
                                            physics:
                                                NeverScrollableScrollPhysics(),
                                            itemCount: driver.length,
                                            padding: const EdgeInsets.only(
                                              bottom: 24,
                                            ),
                                            gridDelegate:
                                                SliverGridDelegateWithFixedCrossAxisCount(
                                                  crossAxisCount: 3,
                                                  crossAxisSpacing: 10.w,
                                                  mainAxisSpacing: 24.h,
                                                  childAspectRatio: 0.95,
                                                ),
                                            itemBuilder: (context, index) {
                                              final user = driver[index];

                                              return UserCard(
                                                image: user.profileImage,
                                                name: user.username,
                                                status: user.role,
                                                totalRides:
                                                    user.totalRides.toString(),
                                                completedRides:
                                                    user.completed.toString(),
                                                canceledRides:
                                                    user.canceled.toString(),
                                                onViewProfile: () {
                                                  Get.toNamed(
                                                    kDriverDetailScreenRoute,
                                                    arguments: user.id,
                                                  );
                                                },
                                              );
                                            },
                                          ),

                                          SizedBox(height: 43),
                                          Obx(
                                            () => CustomPagination(
                                              currentPage:
                                                  controller.currentPage.value,
                                              visiblePages:
                                                  controller.visiblePageNumbers,
                                              onPrevious:
                                                  controller.goToPreviousPage,
                                              onNext: controller.goToNextPage,
                                              onPageSelected:
                                                  controller.goToPage,
                                            ),
                                          ),
                                        ],
                                      );
                                    }),

                                    SizedBox(height: 24),
                                  ],
                                ),
                              ),
                            ),
                            // Obx(() => Container(
                            //   width: width,
                            //   decoration: BoxDecoration(
                            //     borderRadius: BorderRadius.circular(12),
                            //     border: Border.all(
                            //         color: kGreyColor, width: 0.3),
                            //   ),
                            //   child: Padding(
                            //     padding: EdgeInsets.symmetric(vertical: 33.h,horizontal: 25.w),
                            //     child: Column(
                            //       crossAxisAlignment: CrossAxisAlignment.start,
                            //       children: [
                            //         Row(
                            //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //           children: [
                            //             Text(
                            //               "Driver Account Request",
                            //               style: AppStyles.regularGilroyTextStyle()
                            //                   .copyWith(
                            //                 fontSize: 20.sp,
                            //                 fontWeight: FontWeight.w600,
                            //               ),
                            //             ),
                            //             SizedBox(
                            //               height: 45,
                            //               width: 331.w,
                            //               child: CustomTextField(
                            //                 hintText: "Search here...",
                            //                 // width: 357.w,
                            //                 prefix: Padding(
                            //                   padding: const EdgeInsets.all(
                            //                     12.0,
                            //                   ),
                            //                   child: SvgPicture.asset(
                            //                     kSearchIcon,
                            //                   ),
                            //                 ),
                            //                 hintSize: 11,
                            //                 textSize: 11,
                            //                 contentPadding: EdgeInsets.all(0),
                            //               ),
                            //             ),
                            //           ],
                            //         ),
                            //         SizedBox(height: 22.h,),
                            //         Stack(
                            //           children: [
                            //             Container(
                            //               height: 70,
                            //               decoration: BoxDecoration(
                            //                 color: kGreyColor15.withOpacity(0.2),
                            //                 borderRadius: BorderRadius.circular(12),
                            //               ),
                            //             ),
                            //             SizedBox(
                            //               width: width,
                            //               child: DataTable(
                            //                 columnSpacing: 0,
                            //                 headingRowHeight: 70,
                            //                 dividerThickness: 0,
                            //                 columns: [
                            //                   DataColumn(label: Container(width: 50),columnWidth: FixedColumnWidth(50)),
                            //                   DataColumn(
                            //                     label: Flexible(
                            //                       child: Text(
                            //                         "Name",
                            //                         overflow: TextOverflow.ellipsis,
                            //                         maxLines: 1,
                            //                         style:
                            //                         AppStyles.regularGilroyTextStyle()
                            //                             .copyWith(
                            //                           fontSize: 16.sp,
                            //                           fontWeight: FontWeight.w600,
                            //                         ),
                            //                       ),
                            //                     ),
                            //                   ),
                            //                   DataColumn(
                            //                     label: Flexible(
                            //                       child: Text(
                            //                         "Role",
                            //                         overflow: TextOverflow.ellipsis,
                            //                         maxLines: 1,
                            //                         style:
                            //                         AppStyles.regularGilroyTextStyle()
                            //                             .copyWith(
                            //                           fontSize: 16.sp,
                            //                           fontWeight: FontWeight.w600,
                            //                         ),
                            //                       ),
                            //                     ),
                            //                   ),
                            //                   DataColumn(
                            //                     label: Flexible(
                            //                       child: Text(
                            //                         "Account Create Date",
                            //                         overflow: TextOverflow.ellipsis,
                            //                         maxLines: 1,
                            //                         style:
                            //                         AppStyles.regularGilroyTextStyle()
                            //                             .copyWith(
                            //                           fontSize: 16.sp,
                            //                           fontWeight: FontWeight.w600,
                            //                         ),
                            //                       ),
                            //                     ),
                            //                   ),
                            //                   DataColumn(
                            //                     headingRowAlignment:
                            //                     MainAxisAlignment.center,
                            //                     label: Flexible(
                            //                       child: Text(
                            //                         "Stats",
                            //                         overflow: TextOverflow.ellipsis,
                            //                         maxLines: 1,
                            //                         style:
                            //                         AppStyles.regularGilroyTextStyle()
                            //                             .copyWith(
                            //                           fontSize: 16.sp,
                            //                           fontWeight: FontWeight.w600,
                            //                         ),
                            //                       ),
                            //                     ),
                            //                   ),
                            //                   DataColumn(
                            //                     headingRowAlignment:
                            //                     MainAxisAlignment.center,
                            //                     label: Flexible(
                            //                       child: Text(
                            //                         "Actions",
                            //                         overflow: TextOverflow.ellipsis,
                            //                         maxLines: 1,
                            //                         style:
                            //                         AppStyles.regularGilroyTextStyle()
                            //                             .copyWith(
                            //                           fontSize: 16.sp,
                            //                           fontWeight: FontWeight.w600,
                            //                         ),
                            //                       ),
                            //                     ),
                            //                   ),
                            //                 ],
                            //                 rows: controller.pagedUsers
                            //                     .map((user) => _buildDataRow(
                            //                     user['name']!,
                            //                     user['role']!,
                            //                     user['createData']!,
                            //                     user['status'],
                            //                     user,
                            //                     context))
                            //                     .toList(),
                            //                 dataRowMaxHeight: 70,
                            //               ),
                            //             ),
                            //           ],
                            //         ),
                            //         SizedBox(height: 35.h,),
                            //         Obx(() => CustomPagination(
                            //           currentPage: controller.currentPage.value,
                            //           visiblePages: controller.visiblePageNumbers,
                            //           onPrevious: controller.goToPreviousPage,
                            //           onNext: controller.goToNextPage,
                            //           onPageSelected: controller.goToPage,
                            //         )),

                            //       ],
                            //     ),
                            //   ),
                            // )),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
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
    // String arrowIcon,
    // String value,
    // String percent,
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
          // Row(
          //   children: [
          //     SvgPicture.asset(arrowIcon, height: 20, width: 20),
          //     SizedBox(width: 8),
          //     Text(
          //       value,
          //       style: AppStyles.regularGilroyTextStyle().copyWith(
          //         fontSize: 14.sp,
          //         color: kGreyColor4,
          //         fontWeight: FontWeight.w400,
          //       ),
          //     ),
          //     SizedBox(width: 12),
          //     Text(
          //       "$percent% this week",
          //       style: AppStyles.regularGilroyTextStyle().copyWith(
          //         fontSize: 14.sp,
          //         color: kGreyColor4,
          //         fontWeight: FontWeight.w400,
          //       ),
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }
}
