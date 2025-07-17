import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lahakni_web/custom_widgets/custom_appBar_row.dart';
import 'package:lahakni_web/custom_widgets/custom_error_widget.dart';
import 'package:lahakni_web/models/driver_model.dart';
import 'package:lahakni_web/screens/driver_screens/controller/driver_controller.dart';
import 'package:lahakni_web/utils/app_strings.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_styles.dart';
import '../../custom_widgets/custom_pagination.dart';
import '../../custom_widgets/viewDriverDialog.dart';

import '../notifications/controller/notification_controller.dart';
import '../notifications/notification_screen.dart';
import '../sidemenu/sidemenu.dart';

class DriverScreen extends GetView<DriverController> {
  DriverScreen({super.key});

  final NotificationController notificationController = Get.put(
    NotificationController(),
  );

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
                            CustomAppbarRow(title: "Drivers"),
                            SizedBox(height: 28),
                            Container(
                              width: width,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: kGreyColor,
                                  width: 0.3,
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: 33.h,
                                  horizontal: 25.w,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Driver Account Request",
                                          style:
                                              AppStyles.regularGilroyTextStyle()
                                                  .copyWith(
                                                    fontSize: 20.sp,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 22.h),
                                    Obx(
                                      () =>
                                          controller.isLoading.value
                                              ? Center(
                                                child:
                                                    CircularProgressIndicator(),
                                              )
                                              : controller.isError.value
                                              ? CustomErrorWidget(
                                                title:
                                                    controller.errorMsg.value,
                                                onTap: () {
                                                  controller
                                                      .getUnApprovedDrivers();
                                                },
                                              )
                                              : controller.pagedUsers.isEmpty
                                              ? Center(
                                                child: Text(
                                                  "No requests",
                                                  style:
                                                      AppStyles.blackTextStyle()
                                                          .copyWith(
                                                            fontSize: 15.sp,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                ),
                                              )
                                              : Column(
                                                children: [
                                                  Stack(
                                                    children: [
                                                      Container(
                                                        height: 70,
                                                        decoration: BoxDecoration(
                                                          color: kGreyColor15
                                                              .withOpacity(0.2),
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                12,
                                                              ),
                                                        ),
                                                      ),

                                                      SizedBox(
                                                        width: width,
                                                        child: DataTable(
                                                          columnSpacing: 0,
                                                          headingRowHeight: 70,
                                                          dividerThickness: 0,
                                                          columns: [
                                                            DataColumn(
                                                              label: Flexible(
                                                                child: Text(
                                                                  "Name",
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  maxLines: 1,
                                                                  style: AppStyles.regularGilroyTextStyle().copyWith(
                                                                    fontSize:
                                                                        16.sp,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            DataColumn(
                                                              label: Flexible(
                                                                child: Text(
                                                                  "Category",
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  maxLines: 1,
                                                                  style: AppStyles.regularGilroyTextStyle().copyWith(
                                                                    fontSize:
                                                                        16.sp,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),

                                                            DataColumn(
                                                              headingRowAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              label: Flexible(
                                                                child: Text(
                                                                  "Actions",
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  maxLines: 1,
                                                                  style: AppStyles.regularGilroyTextStyle().copyWith(
                                                                    fontSize:
                                                                        16.sp,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                          rows:
                                                              controller
                                                                  .pagedUsers
                                                                  .map(
                                                                    (
                                                                      user,
                                                                    ) => _buildDataRow(
                                                                      user,
                                                                      context,
                                                                    ),
                                                                  )
                                                                  .toList(),
                                                          dataRowMaxHeight: 70,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(height: 35.h),
                                                  Obx(
                                                    () => CustomPagination(
                                                      currentPage:
                                                          controller
                                                              .currentPage
                                                              .value,
                                                      visiblePages:
                                                          controller
                                                              .visiblePageNumbers,
                                                      onPrevious:
                                                          controller
                                                              .goToPreviousPage,
                                                      onNext:
                                                          controller
                                                              .goToNextPage,
                                                      onPageSelected:
                                                          controller.goToPage,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            SizedBox(height: 35.h),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Obx(
                () => NotificationPanel(
                  show: notificationController.showNotification.value,
                  onClose:
                      () =>
                          notificationController.showNotification.value = false,
                  notifications: notificationController.notifications,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  DataRow _buildDataRow(DriverModel user, context) {
    return DataRow(
      color: WidgetStateProperty.all(Colors.transparent),
      cells: [
        DataCell(
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () {
                Get.toNamed(kDriverDetailScreenRoute, arguments: user.userId);
              },
              child: Text(
                user.name,
                textAlign: TextAlign.center,
                style: AppStyles.blackTextStyle().copyWith(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
        DataCell(
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () {
                Get.toNamed(kDriverDetailScreenRoute, arguments: user.userId);
              },
              child: Text(
                user.vehicleType,
                textAlign: TextAlign.center,
                style: AppStyles.blackTextStyle().copyWith(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                ),
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
                    controller.getDriverDetail(user.userId);
                    Get.dialog(viewDriverDialog(context, user.userId));
                  },
                  child: Container(
                    height: 44,
                    width: 100.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: kPrimaryColor),
                      color: kWhiteColor,
                    ),
                    child: Center(
                      child: Text(
                        "View",
                        style: AppStyles.semiBoldGilroyTextStyle().copyWith(
                          fontSize: 13,
                          color: kPrimaryColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 14.w),
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () {
                    controller.approveDriver(user.userId);
                  },
                  child: Container(
                    height: 44,
                    width: 100.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: kPrimaryColor),
                      color: kPrimaryColor,
                    ),
                    child: Center(
                      child: Text(
                        "Approve",
                        style: AppStyles.semiBoldGilroyTextStyle().copyWith(
                          fontSize: 13,
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
}
