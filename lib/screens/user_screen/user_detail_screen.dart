import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lahakni_web/custom_widgets/custom_appBar_row.dart';
import 'package:lahakni_web/custom_widgets/custom_button.dart';
import 'package:lahakni_web/custom_widgets/custom_error_widget.dart';
import 'package:lahakni_web/custom_widgets/suspend_user_dialog.dart';
import 'package:lahakni_web/custom_widgets/user_card.dart';
import 'package:lahakni_web/screens/user_screen/controller/user_controller.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_images.dart';
import '../../../utils/app_styles.dart';
import '../sidemenu/sidemenu.dart';

class UserDetailScreen extends StatefulWidget {
  const UserDetailScreen({super.key});

  @override
  State<UserDetailScreen> createState() => _UserDetailScreenState();
}

class _UserDetailScreenState extends State<UserDetailScreen> {
  final UserController controller = Get.find();
  late String id;
  @override
  initState() {
    super.initState();
    id = Get.arguments as String;
    controller.geCustomerDetail(id);
  }

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

  // Widget _buildLegend(Color color, String text) {
  //   return Row(
  //     children: [
  //       CircleAvatar(radius: 5, backgroundColor: color),
  //       SizedBox(width: 6),
  //       Text(
  //         text,
  //         style: AppStyles.regularGilroyTextStyle().copyWith(fontSize: 14.sp),
  //       ),
  //     ],
  //   );
  // }

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
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SideMenu(),
              Expanded(
                child: Obx(
                  () =>
                      controller.isLoading1.value
                          ? Center(child: CircularProgressIndicator())
                          : controller.isError1.value
                          ? CustomErrorWidget(
                            title: controller.errorMsg1.value,
                            onTap: () {
                              controller.geCustomerDetail(id);
                            },
                          )
                          : controller.customerDetail.value.id.isEmpty
                          ? Center(
                            child: Text(
                              "No data found",
                              style: AppStyles.blackTextStyle().copyWith(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          )
                          : Padding(
                            padding: EdgeInsets.only(
                              left: 50.0.w,
                              top: 36.h,
                              right: 50.w,
                              bottom: 36.h,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomAppbarRow(
                                  title: "Passenger Profile Details",
                                ),
                                SizedBox(height: 20),
                                InkWell(
                                  onTap: () {
                                    Get.back();
                                  },
                                  child: Container(
                                    height: 55,
                                    width: 55,
                                    decoration: BoxDecoration(
                                      color: kGreyColor9,
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: Center(
                                      child: Icon(
                                        Icons.arrow_back_ios,
                                        size: 22,
                                        color: kBlackTextColor3,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 20),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      spacing: 24,
                                      children: [
                                        Obx(
                                          () => UserCard(
                                            image:
                                                controller
                                                    .customerDetail
                                                    .value
                                                    .profileImage,
                                            name:
                                                controller
                                                    .customerDetail
                                                    .value
                                                    .username,
                                            status:
                                                controller
                                                    .customerDetail
                                                    .value
                                                    .role,
                                            totalRides:
                                                controller
                                                    .customerDetail
                                                    .value
                                                    .totalRides
                                                    .toString(),
                                            completedRides:
                                                controller
                                                    .customerDetail
                                                    .value
                                                    .completed
                                                    .toString(),
                                            canceledRides:
                                                controller
                                                    .customerDetail
                                                    .value
                                                    .canceled
                                                    .toString(),
                                            isSuspend:
                                                controller
                                                    .customerDetail
                                                    .value
                                                    .isSuspend,
                                            onViewProfile: () {
                                              Get.dialog(
                                                suspendDialog(
                                                  controller
                                                      .customerDetail
                                                      .value,
                                                ),
                                              );
                                            },
                                            isUserDetail: true,
                                          ),
                                        ),
                                        // Container(
                                        //   width: width / 4.2,
                                        //   decoration: BoxDecoration(
                                        //     border: Border.all(
                                        //       color: kGreyColor3,
                                        //     ),
                                        //     borderRadius:
                                        //         BorderRadius.circular(12),
                                        //   ),
                                        //   child: Padding(
                                        //     padding:
                                        //         const EdgeInsets.symmetric(
                                        //           vertical: 30,
                                        //           horizontal: 35,
                                        //         ),
                                        //     child: Column(
                                        //       crossAxisAlignment:
                                        //           CrossAxisAlignment.start,
                                        //       children: [
                                        //         Text(
                                        //           "Payment",
                                        //           style:
                                        //               AppStyles.semiBoldGilroyTextStyle()
                                        //                   .copyWith(
                                        //                     fontSize: 20.sp,
                                        //                   ),
                                        //         ),
                                        //         Center(
                                        //           child: SizedBox(
                                        //             width: 208,
                                        //             height: 208,
                                        //             child: PieChart(
                                        //               PieChartData(
                                        //                 sectionsSpace: 10,
                                        //                 centerSpaceRadius: 50,
                                        //                 startDegreeOffset:
                                        //                     270,
                                        //                 sections: [
                                        //                   PieChartSectionData(
                                        //                     color:
                                        //                         kBlackColor,
                                        //                     value: 30,
                                        //                     radius: 18,
                                        //                     showTitle: false,
                                        //                   ),
                                        //                   PieChartSectionData(
                                        //                     color:
                                        //                         kGreenColor,
                                        //                     value: 40,
                                        //                     radius: 18,
                                        //                     showTitle: false,
                                        //                   ),
                                        //                   PieChartSectionData(
                                        //                     color: kRedColor,
                                        //                     value: 30,
                                        //                     radius: 18,
                                        //                     showTitle: false,
                                        //                   ),
                                        //                 ],
                                        //               ),
                                        //             ),
                                        //           ),
                                        //         ),
                                        //         SizedBox(height: 30.h),
                                        //         Row(
                                        //           children: [
                                        //             _buildLegend(
                                        //               kBlackColor,
                                        //               "Completed",
                                        //             ),
                                        //             SizedBox(width: 20.w),
                                        //             _buildLegend(
                                        //               kGreenColor,
                                        //               "Pending",
                                        //             ),
                                        //             SizedBox(width: 20.w),
                                        //             _buildLegend(
                                        //               kRedColor,
                                        //               "Canceled",
                                        //             ),
                                        //           ],
                                        //         ),
                                        //       ],
                                        //     ),
                                        //   ),
                                        // ),
                                      ],
                                    ),
                                    SizedBox(width: 32.w),
                                    Expanded(
                                      child: Container(
                                        width: width,
                                        height:
                                            MediaQuery.of(context).size.height /
                                            1.4,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: kGreyColor3,
                                          ),
                                          borderRadius: BorderRadius.circular(
                                            12,
                                          ),
                                        ),
                                        child: SingleChildScrollView(
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                              vertical: 30,
                                              horizontal: 42,
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Ride History",
                                                  style:
                                                      AppStyles.semiBoldGilroyTextStyle()
                                                          .copyWith(
                                                            fontSize: 24.sp,
                                                          ),
                                                ),
                                                SizedBox(height: 30.h),
                                                Obx(
                                                  () =>
                                                      controller.rides.isEmpty
                                                          ? Center(
                                                            child: Text(
                                                              "No rides history",
                                                              style: AppStyles.blackTextStyle()
                                                                  .copyWith(
                                                                    fontSize:
                                                                        15.sp,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                  ),
                                                            ),
                                                          )
                                                          : ListView.builder(
                                                            shrinkWrap: true,
                                                            itemCount:
                                                                controller
                                                                    .rides
                                                                    .length,
                                                            physics:
                                                                NeverScrollableScrollPhysics(),
                                                            itemBuilder: (
                                                              context,
                                                              index,
                                                            ) {
                                                              final ride =
                                                                  controller
                                                                      .rides[index];
                                                              String
                                                              formatRideCreatedAt(
                                                                String
                                                                createdAt,
                                                              ) {
                                                                try {
                                                                  final date =
                                                                      DateTime.parse(
                                                                        createdAt,
                                                                      ).toLocal();
                                                                  final timeFormat =
                                                                      DateFormat(
                                                                        'h:mma',
                                                                      );
                                                                  final dateFormat =
                                                                      DateFormat(
                                                                        'dd/MM',
                                                                      );
                                                                  return "${timeFormat.format(date).toLowerCase()} ${dateFormat.format(date)}";
                                                                } catch (e) {
                                                                  return createdAt;
                                                                }
                                                              }

                                                              return Padding(
                                                                padding:
                                                                    EdgeInsets.only(
                                                                      bottom:
                                                                          20.h,
                                                                    ),
                                                                child: Container(
                                                                  width: width,
                                                                  decoration: BoxDecoration(
                                                                    border: Border.all(
                                                                      color:
                                                                          kGreyColor3,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                          12,
                                                                        ),
                                                                  ),
                                                                  child: Padding(
                                                                    padding: const EdgeInsets.symmetric(
                                                                      horizontal:
                                                                          20,
                                                                      vertical:
                                                                          28,
                                                                    ),
                                                                    child: Column(
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Row(
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            Row(
                                                                              children: [
                                                                                Column(
                                                                                  children: [
                                                                                    SvgPicture.asset(
                                                                                      kCursorIcon,
                                                                                      height:
                                                                                          38,
                                                                                      width:
                                                                                          38,
                                                                                    ),
                                                                                    Image.asset(
                                                                                      kLineImage,
                                                                                      height:
                                                                                          34,
                                                                                      width:
                                                                                          2,
                                                                                    ),
                                                                                    SvgPicture.asset(
                                                                                      kLocationIcon,
                                                                                      height:
                                                                                          38,
                                                                                      width:
                                                                                          38,
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                                SizedBox(
                                                                                  width:
                                                                                      4,
                                                                                ),
                                                                                Column(
                                                                                  crossAxisAlignment:
                                                                                      CrossAxisAlignment.start,
                                                                                  children: [
                                                                                    Text(
                                                                                      ride.from,
                                                                                      style: AppStyles.regularGilroyTextStyle().copyWith(
                                                                                        fontSize:
                                                                                            18.sp,
                                                                                      ),
                                                                                    ),
                                                                                    SizedBox(
                                                                                      height:
                                                                                          35.h,
                                                                                    ),
                                                                                    Text(
                                                                                      ride.to,
                                                                                      style: AppStyles.regularGilroyTextStyle().copyWith(
                                                                                        fontSize:
                                                                                            18.sp,
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ],
                                                                            ),
                                                                            CustomButton(
                                                                              title:
                                                                                  ride.status,
                                                                              onTap:
                                                                                  () {},
                                                                              height:
                                                                                  50,
                                                                              width:
                                                                                  138.w,
                                                                              color:
                                                                                  ride.status ==
                                                                                              "accepted" ||
                                                                                          ride.status ==
                                                                                              "completed"
                                                                                      ? kGreyColor7
                                                                                      : ride.status ==
                                                                                          "canceled"
                                                                                      ? kRedShadeColor
                                                                                      : kPrimaryColor.withOpacity(
                                                                                        0.11,
                                                                                      ),
                                                                              textColor:
                                                                                  ride.status ==
                                                                                              "accepted" ||
                                                                                          ride.status ==
                                                                                              "completed"
                                                                                      ? kGreenShadeColor
                                                                                      : ride.status ==
                                                                                          "canceled"
                                                                                      ? kRedShade1Color
                                                                                      : kBlackColor,

                                                                              borderColor:
                                                                                  kWhiteColor,
                                                                              borderRadius:
                                                                                  100,
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        SizedBox(
                                                                          height:
                                                                              30.h,
                                                                        ),
                                                                        Row(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            Text(
                                                                              formatRideCreatedAt(
                                                                                ride.createdAt,
                                                                              ),
                                                                              style: AppStyles.regularGilroyTextStyle().copyWith(
                                                                                fontSize:
                                                                                    18.sp,
                                                                              ),
                                                                            ),
                                                                            Column(
                                                                              crossAxisAlignment:
                                                                                  CrossAxisAlignment.end,
                                                                              children: [
                                                                                Text(
                                                                                  "Fare Bid   ",
                                                                                  style: AppStyles.semiBoldGilroyTextStyle().copyWith(
                                                                                    fontSize:
                                                                                        18.sp,
                                                                                    color:
                                                                                        kGreenColor,
                                                                                  ),
                                                                                ),
                                                                                Text(
                                                                                  "   \$${ride.offeredFare}",
                                                                                  style: AppStyles.semiBoldGilroyTextStyle().copyWith(
                                                                                    fontSize:
                                                                                        18.sp,
                                                                                    color:
                                                                                        kGreenColor,
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                          ),
                                                ),
                                              ],
                                            ),
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
}
