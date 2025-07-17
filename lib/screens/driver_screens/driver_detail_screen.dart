import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lahakni_web/custom_widgets/custom_appBar_row.dart';
import 'package:lahakni_web/custom_widgets/custom_error_widget.dart';
import 'package:lahakni_web/custom_widgets/custom_image_widget.dart';
import 'package:lahakni_web/custom_widgets/suspend_user_dialog.dart';
import 'package:lahakni_web/custom_widgets/user_card.dart';
import 'package:lahakni_web/models/driver_detail_model.dart';
import 'package:lahakni_web/models/ride_model.dart';
import 'package:lahakni_web/screens/driver_screens/controller/driver_controller.dart';
import 'package:lahakni_web/utils/app_strings.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_images.dart';
import '../../../utils/app_styles.dart';
import '../../custom_widgets/custom_pagination.dart';
import '../../custom_widgets/custom_row.dart';
import '../sidemenu/sidemenu.dart';

class DriverDetailScreen extends StatefulWidget {
  const DriverDetailScreen({super.key});

  @override
  State<DriverDetailScreen> createState() => _DriverDetailScreenState();
}

class _DriverDetailScreenState extends State<DriverDetailScreen> {
  final DriverController controller = Get.find();
  late String id;
  @override
  initState() {
    super.initState();
    id = Get.arguments as String;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.getDriverDetail(id);
    });
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
                              controller.getDriverDetail(id);
                            },
                          )
                          : controller.driverDetail.value ==
                              DriverDetailModel.empty()
                          ? Center(
                            child: Text(
                              "No data found",
                              style: AppStyles.blackTextStyle().copyWith(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          )
                          : SingleChildScrollView(
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
                                  CustomAppbarRow(
                                    title: "Driver Profile Details",
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                                      .driverDetail
                                                      .value
                                                      .userImage,
                                              name:
                                                  controller
                                                      .driverDetail
                                                      .value
                                                      .name,
                                              status:
                                                  controller
                                                      .driverDetail
                                                      .value
                                                      .role,
                                              totalRides:
                                                  controller
                                                      .driverDetail
                                                      .value
                                                      .totalRides
                                                      .toString(),
                                              completedRides:
                                                  controller
                                                      .driverDetail
                                                      .value
                                                      .canceledRides
                                                      .toString(),
                                              canceledRides:
                                                  controller
                                                      .driverDetail
                                                      .value
                                                      .canceledRides
                                                      .toString(),
                                              isSuspend:
                                                  controller
                                                      .driverDetail
                                                      .value
                                                      .isSuspend,
                                              onViewProfile: () {
                                                Get.dialog(
                                                  suspendDriverDialog(
                                                    controller
                                                        .driverDetail
                                                        .value,
                                                  ),
                                                );
                                              },
                                              isUserDetail: true,
                                              isTopPerforming: true,
                                              earning:
                                                  controller
                                                      .driverDetail
                                                      .value
                                                      .totalEarnings
                                                      .toString(),
                                              isDriver: true,
                                            ),
                                          ),
                                          Container(
                                            width: width / 4.2,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: kGreyColor3,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                    vertical: 30,
                                                    horizontal: 35,
                                                  ),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                spacing: 25.h,
                                                children: [
                                                  Text(
                                                    "Vehicle Details",
                                                    style:
                                                        AppStyles.semiBoldGilroyTextStyle()
                                                            .copyWith(
                                                              fontSize: 20.sp,
                                                            ),
                                                  ),
                                                  customRow(
                                                    "Car Plate Number",
                                                    controller
                                                        .driverDetail
                                                        .value
                                                        .driverDetails
                                                        .first
                                                        .vehicleNumber,
                                                    detailColor: kGreenColor,
                                                  ),
                                                  customRow(
                                                    "Car Model",
                                                    controller
                                                        .driverDetail
                                                        .value
                                                        .driverDetails
                                                        .first
                                                        .vehicleModel,
                                                    detailColor: kGreenColor,
                                                  ),
                                                  customRow(
                                                    "Issued State",
                                                    controller
                                                        .driverDetail
                                                        .value
                                                        .driverDetails
                                                        .first
                                                        .vehicleIssueState,
                                                    detailColor: kGreenColor,
                                                  ),
                                                  customRow(
                                                    "Vehicle Type",
                                                    controller
                                                        .driverDetail
                                                        .value
                                                        .driverDetails
                                                        .first
                                                        .vehicleType,
                                                    detailColor: kGreenColor,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Expanded(
                                                        child: Container(
                                                          height: 90,
                                                          decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius.circular(
                                                                  15,
                                                                ),
                                                          ),
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius.circular(
                                                                  15,
                                                                ),
                                                            child: CustomImageWidget(
                                                              imageUrl:
                                                                  controller
                                                                      .driverDetail
                                                                      .value
                                                                      .driverDetails
                                                                      .first
                                                                      .drivingLicenseBackImage,
                                                              height: 90,
                                                              width: 90,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(width: 18.w),
                                                      Expanded(
                                                        child: Container(
                                                          height: 90,
                                                          decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius.circular(
                                                                  15,
                                                                ),
                                                          ),
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius.circular(
                                                                  15,
                                                                ),
                                                            child: CustomImageWidget(
                                                              imageUrl:
                                                                  controller
                                                                      .driverDetail
                                                                      .value
                                                                      .driverDetails
                                                                      .first
                                                                      .drivingLicenseFrontImage,
                                                              height: 90,
                                                              width: 90,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            12,
                                                          ),
                                                      border: Border.all(
                                                        color: kGreyColor3,
                                                      ),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                            13,
                                                          ),
                                                      child: Row(
                                                        children: [
                                                          Image.asset(
                                                            kDocImage,
                                                            width: 86,
                                                            height: 48,
                                                          ),
                                                          Text(
                                                            "Driving License",
                                                            style:
                                                                AppStyles.semiBoldGilroyTextStyle()
                                                                    .copyWith(
                                                                      fontSize:
                                                                          16.sp,
                                                                    ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(width: 32.w),
                                      Expanded(
                                        child: Column(
                                          children: [
                                            Container(
                                              width: width,
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                  color: kGreyColor3,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                      vertical: 37,
                                                      horizontal: 22,
                                                    ),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          "Ride Bookings",
                                                          style: AppStyles.regularGilroyTextStyle()
                                                              .copyWith(
                                                                fontSize: 20.sp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                              ),
                                                        ),
                                                        // SizedBox(
                                                        //   height: 45,
                                                        //   width: 331.w,
                                                        //   child: CustomTextField(
                                                        //     hintText:
                                                        //         "Search here...",
                                                        //     // width: 357.w,
                                                        //     prefix: Padding(
                                                        //       padding:
                                                        //           const EdgeInsets.all(
                                                        //             12.0,
                                                        //           ),
                                                        //       child:
                                                        //           SvgPicture.asset(
                                                        //             kSearchIcon,
                                                        //           ),
                                                        //     ),
                                                        //     hintSize: 11,
                                                        //     textSize: 11,
                                                        //     contentPadding:
                                                        //         EdgeInsets.all(
                                                        //           0,
                                                        //         ),
                                                        //   ),
                                                        // ),
                                                      ],
                                                    ),
                                                    SizedBox(height: 22.h),
                                                    Obx(
                                                      () =>
                                                          controller
                                                                  .rides
                                                                  .isEmpty
                                                              ? Center(
                                                                child: Text(
                                                                  "No ride bookings",
                                                                  style: AppStyles.blackTextStyle().copyWith(
                                                                    fontSize:
                                                                        15.sp,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                  ),
                                                                ),
                                                              )
                                                              : Column(
                                                                children: [
                                                                  Stack(
                                                                    children: [
                                                                      Container(
                                                                        height:
                                                                            70,
                                                                        decoration: BoxDecoration(
                                                                          color: kTealColor.withOpacity(
                                                                            0.11,
                                                                          ),
                                                                          borderRadius: BorderRadius.circular(
                                                                            12,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      SizedBox(
                                                                        width:
                                                                            width,
                                                                        child: DataTable(
                                                                          columnSpacing:
                                                                              0,
                                                                          headingRowHeight:
                                                                              70,
                                                                          dividerThickness:
                                                                              0,
                                                                          columns: [
                                                                            DataColumn(
                                                                              label: Flexible(
                                                                                child: Text(
                                                                                  "Name",
                                                                                  overflow:
                                                                                      TextOverflow.ellipsis,
                                                                                  maxLines:
                                                                                      1,
                                                                                  style: AppStyles.regularGilroyTextStyle().copyWith(
                                                                                    fontSize:
                                                                                        15.sp,
                                                                                    fontWeight:
                                                                                        FontWeight.w600,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            DataColumn(
                                                                              label: Flexible(
                                                                                child: Text(
                                                                                  "Booking Date",
                                                                                  overflow:
                                                                                      TextOverflow.ellipsis,
                                                                                  maxLines:
                                                                                      1,
                                                                                  style: AppStyles.regularGilroyTextStyle().copyWith(
                                                                                    fontSize:
                                                                                        15.sp,
                                                                                    fontWeight:
                                                                                        FontWeight.w600,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            DataColumn(
                                                                              headingRowAlignment:
                                                                                  MainAxisAlignment.center,
                                                                              label: Flexible(
                                                                                child: Text(
                                                                                  "Status",
                                                                                  overflow:
                                                                                      TextOverflow.ellipsis,
                                                                                  maxLines:
                                                                                      1,
                                                                                  style: AppStyles.regularGilroyTextStyle().copyWith(
                                                                                    fontSize:
                                                                                        15.sp,
                                                                                    fontWeight:
                                                                                        FontWeight.w600,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),

                                                                            DataColumn(
                                                                              headingRowAlignment:
                                                                                  MainAxisAlignment.center,
                                                                              label: Flexible(
                                                                                child: Text(
                                                                                  "Ride Charges",
                                                                                  overflow:
                                                                                      TextOverflow.ellipsis,
                                                                                  maxLines:
                                                                                      1,
                                                                                  style: AppStyles.regularGilroyTextStyle().copyWith(
                                                                                    fontSize:
                                                                                        15.sp,
                                                                                    fontWeight:
                                                                                        FontWeight.w600,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            DataColumn(
                                                                              headingRowAlignment:
                                                                                  MainAxisAlignment.center,
                                                                              label: Flexible(
                                                                                child: Text(
                                                                                  "Action",
                                                                                  overflow:
                                                                                      TextOverflow.ellipsis,
                                                                                  maxLines:
                                                                                      1,
                                                                                  style: AppStyles.regularGilroyTextStyle().copyWith(
                                                                                    fontSize:
                                                                                        15.sp,
                                                                                    fontWeight:
                                                                                        FontWeight.w600,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                          rows:
                                                                              controller.pagedUsers2
                                                                                  .map(
                                                                                    (
                                                                                      user,
                                                                                    ) => _buildDataRow(
                                                                                      user,
                                                                                      context,
                                                                                    ),
                                                                                  )
                                                                                  .toList(),
                                                                          dataRowMaxHeight:
                                                                              70,
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  SizedBox(
                                                                    height:
                                                                        35.h,
                                                                  ),
                                                                  Obx(
                                                                    () => CustomPagination(
                                                                      currentPage:
                                                                          controller
                                                                              .currentPage2
                                                                              .value,
                                                                      visiblePages:
                                                                          controller
                                                                              .visiblePageNumbers2,
                                                                      onPrevious:
                                                                          controller
                                                                              .goToPreviousPage2,
                                                                      onNext:
                                                                          controller
                                                                              .goToNextPage2,
                                                                      onPageSelected:
                                                                          controller
                                                                              .goToPage2,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            SizedBox(height: 32.h),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
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

  DataRow _buildDataRow(RideModel ride, context) {
    String formatRideCreatedAt(String createdAt) {
      try {
        final date = DateTime.parse(createdAt).toLocal();
        final day = date.day.toString().padLeft(2, '0');
        final month = date.month.toString().padLeft(2, '0');
        final hour =
            date.hour > 12
                ? (date.hour - 12)
                : (date.hour == 0 ? 12 : date.hour);
        final minute = date.minute.toString().padLeft(2, '0');
        return "$day-$month- At $hour:$minute";
      } catch (e) {
        return createdAt;
      }
    }

    return DataRow(
      color: WidgetStateProperty.all(Colors.transparent),
      cells: [
        DataCell(
          Text(
            ride.customer!.name.isEmpty ? "Unknown" : ride.customer!.name,
            textAlign: TextAlign.center,
            style: AppStyles.regularGilroyTextStyle().copyWith(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),

        DataCell(
          Text(
            formatRideCreatedAt(ride.createdAt),
            textAlign: TextAlign.center,
            style: AppStyles.regularGilroyTextStyle().copyWith(fontSize: 14.sp),
          ),
        ),

        DataCell(
          Center(
            child: Container(
              height: 33,
              width: 100.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: kGreenColor.withOpacity(0.11),
              ),
              child: Center(
                child: Text(
                  ride.status,
                  style: AppStyles.semiBoldGilroyTextStyle().copyWith(
                    fontSize: 10,
                    color: kPrimaryColor,
                  ),
                ),
              ),
            ),
          ),
        ),

        DataCell(
          Center(
            child: Text(
              "\$${ride.offeredFare}",
              textAlign: TextAlign.center,
              style: AppStyles.regularGilroyTextStyle().copyWith(
                fontSize: 14.sp,
              ),
            ),
          ),
        ),
        DataCell(
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () {
                    Get.toNamed(kRideDetailScreenRoute, arguments: ride.id);
                  },
                  child: Container(
                    height: 34,
                    width: 100.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: kPrimaryColor),
                      color: kPrimaryColor,
                    ),
                    child: Center(
                      child: Text(
                        "View Details",
                        style: AppStyles.semiBoldGilroyTextStyle().copyWith(
                          fontSize: 10,
                          color: kWhiteColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
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
}
