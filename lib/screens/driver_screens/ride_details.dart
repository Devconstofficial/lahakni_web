import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
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
import '../../custom_widgets/viewDriverDialog.dart';
import '../../utils/app_strings.dart';
import '../notifications/controller/notification_controller.dart';
import '../notifications/notification_screen.dart';
import '../sidemenu/controller/sidemenu_controller.dart';
import '../sidemenu/sidemenu.dart';

class RideDetailScreen extends GetView<DriverController> {
  RideDetailScreen({super.key});
  final NotificationController notificationController = Get.put(NotificationController());

  Widget _buildMap(
      double? pickupLat,
      double? pickupLng,
      double? dropoffLat,
      double? dropoffLng,
      context
      ) {
    if (pickupLat == null ||
        pickupLng == null ||
        dropoffLat == null ||
        dropoffLng == null) {
      return Text("Location not available", style: AppStyles.blackTextStyle());
    }

    return Container(
      height: MediaQuery.of(context).size.height / 1.3,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: GoogleMap(
          initialCameraPosition: CameraPosition(
            target: LatLng(pickupLat, pickupLng),
            zoom: 12,
          ),
          markers: {
            Marker(
              markerId: MarkerId("pickup"),
              position: LatLng(pickupLat, pickupLng),
              icon: BitmapDescriptor.defaultMarkerWithHue(
                BitmapDescriptor.hueBlue,
              ),
              infoWindow: InfoWindow(title: "Pickup Location"),
            ),
            Marker(
              markerId: MarkerId("dropoff"),
              position: LatLng(dropoffLat, dropoffLng),
              icon: BitmapDescriptor.defaultMarkerWithHue(
                BitmapDescriptor.hueRed,
              ),
              infoWindow: InfoWindow(title: "Drop-off Location"),
            ),
          },
          polylines: {
            Polyline(
              polylineId: PolylineId("route"),
              color: kPrimaryColor,
              width: 3,
              points: [
                LatLng(pickupLat, pickupLng),
                LatLng(dropoffLat, dropoffLng),
              ],
              patterns: [PatternItem.dash(10), PatternItem.gap(5)],
            ),
          },
        ),
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    final Map<String, dynamic> args = Get.arguments;
    final user = Get.arguments['user'];

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
                                  "Ride Details",
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
                              children: [
                                Expanded(

                                  flex: 3,
                                  child: _buildMap(
                                    user['pickupLat'],
                                    user['pickupLng'],
                                    user['dropoffLat'],
                                    user['dropoffLng'],
                                    context
                                  ),
                                ),
                                SizedBox(width: 20.w),
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    height: MediaQuery.of(context).size.height / 1.4,
                                    width: width,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: kGreyColor3),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 54,horizontal: 28),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Column(
                                                children: [
                                                  SvgPicture.asset(kCursorIcon,height: 40,width: 40,),
                                                  Image.asset(kLineImage,height: 34,width: 2,),
                                                  SvgPicture.asset(kLocationIcon,height: 40,width: 40,),

                                                ],
                                              ),
                                              SizedBox(width: 4,),
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Gbagi market, Iwo road",
                                                    style: AppStyles.regularGilroyTextStyle()
                                                        .copyWith(
                                                      fontSize: 20.sp,
                                                    ),
                                                  ),
                                                  SizedBox(height: 43.h,),
                                                  Text(
                                                    "Tulip Pharmacy, Oluwo",
                                                    style: AppStyles.regularGilroyTextStyle()
                                                        .copyWith(
                                                      fontSize: 20.sp,
                                                    ),
                                                  ),

                                                ],
                                              )
                                            ],
                                          ),
                                          SizedBox(height: 45.h,),
                                          Row(
                                            children: [
                                              Container(
                                                height: 67,
                                                width: 74,
                                                decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(14)
                                                ),
                                                child: ClipRRect(
                                                    borderRadius: BorderRadius.circular(14),
                                                    child: Image.asset(kPersonImage1,fit: BoxFit.cover,)),
                                              ),
                                              SizedBox(width: 7,),
                                              Expanded(
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "Mehaik fatima",
                                                      style:
                                                      AppStyles.semiBoldGilroyTextStyle()
                                                          .copyWith(
                                                        fontSize: 24.sp,
                                                      ),
                                                    ),
                                                    Text(
                                                      "Driver",
                                                      style:
                                                      AppStyles.semiBoldGilroyTextStyle()
                                                          .copyWith(
                                                        fontSize: 16.sp,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],),
                                          SizedBox(height: 18.h,),
                                          Row(
                                            children: [
                                              Container(
                                                height: 67,
                                                width: 74,
                                                decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(14)
                                                ),
                                                child: ClipRRect(
                                                    borderRadius: BorderRadius.circular(14),
                                                    child: Image.asset(kPersonImage1,fit: BoxFit.cover,)),
                                              ),
                                              SizedBox(width: 7,),
                                              Expanded(
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "Rabeel Gull",
                                                      style:
                                                      AppStyles.semiBoldGilroyTextStyle()
                                                          .copyWith(
                                                        fontSize: 24.sp,
                                                      ),
                                                    ),
                                                    Text(
                                                      "Passenger",
                                                      style:
                                                      AppStyles.semiBoldGilroyTextStyle()
                                                          .copyWith(
                                                        fontSize: 16.sp,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],),
                                          SizedBox(height: 30.h,),
                                          Row(
                                            children: [
                                              Text(
                                                "Fare Bid \$200",
                                                style: AppStyles.semiBoldGilroyTextStyle()
                                                    .copyWith(
                                                  fontSize: 26.sp,
                                                ),
                                              ),
                                              SizedBox(width: 25.w,),
                                              Text(
                                                "12:59pm 29/05",
                                                style: AppStyles.regularGilroyTextStyle()
                                                    .copyWith(
                                                  fontSize: 26.sp,
                                                ),
                                              ),

                                            ],),
                                          Spacer(),
                                          Row(
                                            children: [
                                              Expanded(child: CustomButton(title: "Update Ride", onTap: (){},width: 206.w,height: 62.h,textSize: 16,fontWeight: FontWeight.w400,textColor: kPrimaryColor,color: kWhiteColor,borderColor: kPrimaryColor,)),
                                              SizedBox(width: 22.w,),
                                              Expanded(child: CustomButton(title: "Send Message", onTap: (){},width: 206.w,height: 62.h,))
                                            ],
                                          )
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


}
