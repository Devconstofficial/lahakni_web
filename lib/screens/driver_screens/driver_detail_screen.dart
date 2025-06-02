import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lahakni_web/custom_widgets/custom_button.dart';
import 'package:lahakni_web/custom_widgets/suspend_user_dialog.dart';
import 'package:lahakni_web/custom_widgets/user_card.dart';
import 'package:lahakni_web/screens/driver_screens/controller/driver_controller.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_images.dart';
import '../../../utils/app_styles.dart';
import '../../custom_widgets/custom_pagination.dart';
import '../../custom_widgets/custom_row.dart';
import '../../custom_widgets/custom_textfield.dart';
import '../../custom_widgets/earning_chart.dart';
import '../../custom_widgets/viewDriverDialog.dart';
import '../../utils/app_strings.dart';
import '../notifications/controller/notification_controller.dart';
import '../notifications/notification_screen.dart';
import '../sidemenu/controller/sidemenu_controller.dart';
import '../sidemenu/sidemenu.dart';

class DriverDetailScreen extends GetView<DriverController> {
  DriverDetailScreen({super.key});
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
                                  "Driver Profile Details",
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
                                customContainer(kSettingsIcon, () {
                                  final SideMenuController menuController = Get.put(SideMenuController());
                                  menuController.onItemTapped(-1);
                                  Get.toNamed(kSettingScreenRoute);
                                }),
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
                            SizedBox(height: 25),
                            InkWell(
                              onTap: (){
                                Get.back();
                              },
                              child: Container(
                                height: 55,
                                width: 55,
                                decoration: BoxDecoration(
                                  color: kGreyColor9,
                                  borderRadius: BorderRadius.circular(4)
                                ),
                                child: Center(child: Icon(Icons.arrow_back_ios,size: 22,color: kBlackTextColor3,)),
                              ),
                            ),
                            SizedBox(height: 27),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  spacing: 24,
                                  children: [
                                    UserCard(
                                      image: kPersonImage1,
                                      name: "Zainab Tariq",
                                      status: "Passenger",
                                      totalRides: "20",
                                      completedRides: "10",
                                      canceledRides: "1",
                                      paymentStatus: "Completed",
                                      onViewProfile: () {
                                        Get.dialog(suspendDialog());
                                      },
                                      isUserDetail: true,
                                      isTopPerforming: true,
                                      earning: "1000",
                                      isDriver: true,
                                    ),
                                    Container(
                                      width: width / 4.2,
                                      decoration: BoxDecoration(
                                        border: Border.all(color: kGreyColor3),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(vertical: 30,horizontal: 35),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
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
                                            customRow("Car Plate Number", "12/6/2024",detailColor: kGreenColor),
                                            customRow("Car Model", "ALP10M90JK",detailColor: kGreenColor),
                                            customRow("Car Make", "3/4/2004",detailColor: kGreenColor),
                                            customRow("Car Model Year", "12/2/2025",detailColor: kGreenColor),
                                            Row(
                                              children: [
                                                Expanded(
                                                  child: Container(
                                                    height: 90,
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(15),
                                                    ),
                                                    child: ClipRRect(
                                                        borderRadius: BorderRadius.circular(15),
                                                        child: Image.asset(kCarBackImage,fit: BoxFit.cover,)),
                                                  ),
                                                ),
                                                SizedBox(width: 18.w,),
                                                Expanded(
                                                  child: Container(
                                                    height: 90,
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(15),
                                                    ),
                                                    child: ClipRRect(
                                                        borderRadius: BorderRadius.circular(15),
                                                        child: Image.asset(kCarFrontImage,fit: BoxFit.cover,)),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Container(
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(12),
                                                border: Border.all(color: kGreyColor3),
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.all(13),
                                                child: Row(
                                                  children: [
                                                    Image.asset(kDocImage,width: 86,height: 48,),
                                                    Text(
                                                      "Driving License",
                                                      style:
                                                      AppStyles.semiBoldGilroyTextStyle()
                                                          .copyWith(
                                                        fontSize: 16.sp,
                                                      ),
                                                    ),

                                                  ],
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(width: 32.w),
                                Expanded(
                                  child: Column(
                                    children: [
                                      Obx(() => Container(
                                        width: width,
                                        decoration: BoxDecoration(
                                          border: Border.all(color: kGreyColor3),
                                          borderRadius: BorderRadius.circular(12),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(vertical: 37,horizontal: 22),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Text(
                                                    "Ride Bookings",
                                                    style: AppStyles.regularGilroyTextStyle()
                                                        .copyWith(
                                                      fontSize: 20.sp,
                                                      fontWeight: FontWeight.w600,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 45,
                                                    width: 331.w,
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
                                                      hintSize: 11,
                                                      textSize: 11,
                                                      contentPadding: EdgeInsets.all(0),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: 22.h,),
                                              Stack(
                                                children: [
                                                  Container(
                                                    height: 70,
                                                    decoration: BoxDecoration(
                                                      color: kTealColor.withOpacity(0.11),
                                                      borderRadius: BorderRadius.circular(12),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: width,
                                                    child: DataTable(
                                                      columnSpacing: 0,
                                                      headingRowHeight: 70,
                                                      dividerThickness: 0,
                                                      columns: [
                                                        DataColumn(label: Container(),columnWidth: FixedColumnWidth(50)),
                                                        DataColumn(
                                                          label: Flexible(
                                                            child: Text(
                                                              "Name",
                                                              overflow: TextOverflow.ellipsis,
                                                              maxLines: 1,
                                                              style:
                                                              AppStyles.regularGilroyTextStyle()
                                                                  .copyWith(
                                                                fontSize: 15.sp,
                                                                fontWeight: FontWeight.w600,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        DataColumn(
                                                          label: Flexible(
                                                            child: Text(
                                                              "Booking Date",
                                                              overflow: TextOverflow.ellipsis,
                                                              maxLines: 1,
                                                              style:
                                                              AppStyles.regularGilroyTextStyle()
                                                                  .copyWith(
                                                                fontSize: 15.sp,
                                                                fontWeight: FontWeight.w600,
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
                                                              overflow: TextOverflow.ellipsis,
                                                              maxLines: 1,
                                                              style:
                                                              AppStyles.regularGilroyTextStyle()
                                                                  .copyWith(
                                                                fontSize: 15.sp,
                                                                fontWeight: FontWeight.w600,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        DataColumn(
                                                          headingRowAlignment:
                                                          MainAxisAlignment.center,
                                                          label: Flexible(
                                                            child: Text(
                                                              "Pay",
                                                              overflow: TextOverflow.ellipsis,
                                                              maxLines: 1,
                                                              style:
                                                              AppStyles.regularGilroyTextStyle()
                                                                  .copyWith(
                                                                fontSize: 15.sp,
                                                                fontWeight: FontWeight.w600,
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
                                                              overflow: TextOverflow.ellipsis,
                                                              maxLines: 1,
                                                              style:
                                                              AppStyles.regularGilroyTextStyle()
                                                                  .copyWith(
                                                                fontSize: 15.sp,
                                                                fontWeight: FontWeight.w600,
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
                                                              overflow: TextOverflow.ellipsis,
                                                              maxLines: 1,
                                                              style:
                                                              AppStyles.regularGilroyTextStyle()
                                                                  .copyWith(
                                                                fontSize: 15.sp,
                                                                fontWeight: FontWeight.w600,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                      rows: controller.pagedUsers2
                                                          .map((user) => _buildDataRow(
                                                          user['name']!,
                                                          user['bookingDate']!,
                                                          user['status']!,
                                                          user['pay'],
                                                          user['charges'],
                                                          user,
                                                          context))
                                                          .toList(),
                                                      dataRowMaxHeight: 70,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: 35.h,),
                                              Obx(() => CustomPagination(
                                                currentPage: controller.currentPage2.value,
                                                visiblePages: controller.visiblePageNumbers2,
                                                onPrevious: controller.goToPreviousPage2,
                                                onNext: controller.goToNextPage2,
                                                onPageSelected: controller.goToPage2,
                                              )),

                                            ],
                                          ),
                                        ),
                                      ),),
                                      SizedBox(height: 32.h,),
                                      Container(
                                          width: width,
                                          decoration: BoxDecoration(
                                            border: Border.all(color: kGreyColor3),
                                            borderRadius: BorderRadius.circular(12),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(vertical: 25,horizontal: 39),
                                            child: Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    Text(
                                                      "Earning",
                                                      style: AppStyles.semiBoldGilroyTextStyle()
                                                          .copyWith(
                                                        fontSize: 20.sp,
                                                      ),
                                                    ),
                                                    Spacer(),
                                                    _buildLegend(kPrimaryColor, "Earning"),
                                                    SizedBox(width: 20.w,),
                                                    _buildLegend(kGreenColor.withOpacity(0.5), "Ride Charges"),

                                                  ],
                                                ),
                                                SizedBox(height: 20),
                                                SizedBox(height: 330.h, child: EarningChart()),
                                              ],
                                            ),
                                          )
                                      )
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

  DataRow _buildDataRow(String name, String bookingDate, String status, String pay ,String rideCharges , Map<String, dynamic> user, context) {

    return DataRow(
      color: WidgetStateProperty.all(Colors.transparent),
      cells: [
        DataCell(
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () {
                user['isChecked'] = !user['isChecked'];
                controller.bookings.refresh();
              },
              child: Container(
                width: 25,
                height: 25,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(
                    color: kBlackColor.withOpacity(0.3),
                  ),
                ),
                child: user['isChecked']
                    ? Icon(Icons.check, size: 16, color: kBlackColor)
                    : null,
              ),
            ),
          ),
        ),
        DataCell(
            Text(
              name,
              textAlign: TextAlign.center,
              style: AppStyles.regularGilroyTextStyle()
                  .copyWith(fontSize: 14.sp, fontWeight: FontWeight.w600),
            )),

        DataCell(Text(
          bookingDate,
          textAlign: TextAlign.center,
          style: AppStyles.regularGilroyTextStyle()
              .copyWith(fontSize: 14.sp, ),
        )),

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
                child: Text(status,style: AppStyles.semiBoldGilroyTextStyle().copyWith(fontSize: 10,color: kPrimaryColor),),
              ),
            ),
          ),
        ),

        DataCell(Center(
          child: Text(
            "\$$pay",
            textAlign: TextAlign.center,
            style: AppStyles.regularGilroyTextStyle()
                .copyWith(fontSize: 14.sp,),
          ),
        )),
        DataCell(Center(
          child: Text(
            "\$$rideCharges",
            textAlign: TextAlign.center,
            style: AppStyles.regularGilroyTextStyle()
                .copyWith(fontSize: 14.sp,),
          ),
        )),
        DataCell(
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: (){
                    Get.toNamed(kRideDetailScreenRoute,arguments: {
                      "user" : user
                    });
                    // Get.dialog(viewDriverDialog(context, user));
                  },
                  child: Container(
                    height: 34,
                    width: 100.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                          color: kPrimaryColor
                      ),
                      color: kPrimaryColor,
                    ),
                    child: Center(
                      child: Text("View Details",style: AppStyles.semiBoldGilroyTextStyle().copyWith(fontSize: 10,color: kWhiteColor),),
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
  Widget _buildLegend(Color color, String text) {
    return Row(
      children: [
        CircleAvatar(radius: 5, backgroundColor: color),
        SizedBox(width: 6),
        Text(text, style: AppStyles.regularGilroyTextStyle().copyWith(fontSize: 14.sp)),
      ],
    );
  }

}
