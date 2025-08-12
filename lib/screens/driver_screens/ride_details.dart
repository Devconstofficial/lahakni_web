import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:lahakni_web/custom_widgets/custom_appBar_row.dart';
import 'package:lahakni_web/custom_widgets/custom_error_widget.dart';
import 'package:lahakni_web/custom_widgets/custom_image_widget.dart';
import 'package:lahakni_web/models/ride_model.dart';
import 'package:lahakni_web/screens/driver_screens/controller/ride_detail_controller.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_images.dart';
import '../../../utils/app_styles.dart';
import '../sidemenu/sidemenu.dart';

class RideDetailScreen extends StatefulWidget {
  const RideDetailScreen({super.key});

  @override
  State<RideDetailScreen> createState() => _RideDetailScreenState();
}

class _RideDetailScreenState extends State<RideDetailScreen> {
  final RideDetailController controller = Get.find();
  late String id;

  @override
  initState() {
    super.initState();
    id = Get.arguments as String;
    controller.geRideDetail(id);
  }

  Widget _buildMap(
    double? pickupLat,
    double? pickupLng,
    double? dropoffLat,
    double? dropoffLng,
    context,
  ) {
    if (pickupLat == null ||
        pickupLng == null ||
        dropoffLat == null ||
        dropoffLng == null) {
      return Text("Location not available", style: AppStyles.blackTextStyle());
    }

    return Container(
      height: MediaQuery.of(context).size.height / 1.4,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(24)),
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
    String formatRideDate(String createdAt) {
      DateTime dateTime = DateTime.parse(createdAt).toLocal();
      return DateFormat('hh:mma dd/MM').format(dateTime).toLowerCase();
    }

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
                          CustomAppbarRow(title: "Ride Booking Details"),
                          SizedBox(height: 22),
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
                          SizedBox(height: 18),
                          Obx(
                            () =>
                                controller.isLoading1.value
                                    ? Expanded(
                                      child: Center(
                                        child: CircularProgressIndicator(),
                                      ),
                                    )
                                    : controller.isError1.value
                                    ? Expanded(
                                      child: CustomErrorWidget(
                                        title: controller.errorMsg1.value,
                                        onTap: () {
                                          controller.geRideDetail(id);
                                        },
                                      ),
                                    )
                                    : controller.rideDetail.value ==
                                        RideModel.empty()
                                    ? Expanded(
                                      child: Center(
                                        child: Text(
                                          "No detail found",
                                          style: AppStyles.blackTextStyle()
                                              .copyWith(
                                                fontSize: 15.sp,
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                      ),
                                    )
                                    : Row(
                                      children: [
                                        Expanded(
                                          flex: 3,
                                          child: _buildMap(
                                            controller
                                                .rideDetail
                                                .value
                                                .pickupLocation!
                                                .coordinates
                                                .first,
                                            controller
                                                .rideDetail
                                                .value
                                                .pickupLocation!
                                                .coordinates
                                                .last,
                                            controller
                                                .rideDetail
                                                .value
                                                .dropoffLocation!
                                                .coordinates
                                                .first,
                                            controller
                                                .rideDetail
                                                .value
                                                .dropoffLocation!
                                                .coordinates
                                                .last,
                                            context,
                                          ),
                                        ),
                                        SizedBox(width: 20.w),
                                        Expanded(
                                          flex: 2,
                                          child: Container(
                                            height:
                                                MediaQuery.of(
                                                  context,
                                                ).size.height /
                                                1.6,
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
                                                    vertical: 54,
                                                    horizontal: 28,
                                                  ),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Column(
                                                        children: [
                                                          SvgPicture.asset(
                                                            kCursorIcon,
                                                            height: 40,
                                                            width: 40,
                                                          ),
                                                          Image.asset(
                                                            kLineImage,
                                                            height: 34,
                                                            width: 2,
                                                          ),
                                                          SvgPicture.asset(
                                                            kLocationIcon,
                                                            height: 40,
                                                            width: 40,
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(width: 4),
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          SizedBox(
                                                            width: 320.w,
                                                            child: Text(
                                                              controller
                                                                  .rideDetail
                                                                  .value
                                                                  .from,
                                                              style: AppStyles.regularGilroyTextStyle()
                                                                  .copyWith(
                                                                    fontSize:
                                                                        18.sp,
                                                                  ),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: 43.h,
                                                          ),
                                                          SizedBox(
                                                            width: 320.w,
                                                            child: Text(
                                                              controller
                                                                  .rideDetail
                                                                  .value
                                                                  .to,
                                                              style: AppStyles.regularGilroyTextStyle()
                                                                  .copyWith(
                                                                    fontSize:
                                                                        18.sp,
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(height: 45.h),
                                                  Row(
                                                    children: [
                                                      Container(
                                                        height: 67,
                                                        width: 74,
                                                        decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                14,
                                                              ),
                                                        ),
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                14,
                                                              ),
                                                          child: CustomImageWidget(
                                                            imageUrl:
                                                                controller
                                                                    .rideDetail
                                                                    .value
                                                                    .rider!
                                                                    .userImage,
                                                            height: 67,
                                                            width: 74,
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(width: 7),
                                                      Expanded(
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              controller
                                                                      .rideDetail
                                                                      .value
                                                                      .rider!
                                                                      .name
                                                                      .isEmpty
                                                                  ? "Unknown"
                                                                  : controller
                                                                      .rideDetail
                                                                      .value
                                                                      .rider!
                                                                      .name,
                                                              style: AppStyles.semiBoldGilroyTextStyle()
                                                                  .copyWith(
                                                                    fontSize:
                                                                        24.sp,
                                                                  ),
                                                            ),
                                                            Text(
                                                              "Driver",
                                                              style: AppStyles.semiBoldGilroyTextStyle()
                                                                  .copyWith(
                                                                    fontSize:
                                                                        16.sp,
                                                                  ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(height: 18.h),
                                                  Row(
                                                    children: [
                                                      Container(
                                                        height: 67,
                                                        width: 74,
                                                        decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                14,
                                                              ),
                                                        ),
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                14,
                                                              ),
                                                          child: CustomImageWidget(
                                                            imageUrl:
                                                                controller
                                                                    .rideDetail
                                                                    .value
                                                                    .customer!
                                                                    .userImage,
                                                            height: 67,
                                                            width: 74,
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(width: 7),
                                                      Expanded(
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              controller
                                                                      .rideDetail
                                                                      .value
                                                                      .customer!
                                                                      .name
                                                                      .isEmpty
                                                                  ? "Unknown"
                                                                  : controller
                                                                      .rideDetail
                                                                      .value
                                                                      .customer!
                                                                      .name,
                                                              style: AppStyles.semiBoldGilroyTextStyle()
                                                                  .copyWith(
                                                                    fontSize:
                                                                        24.sp,
                                                                  ),
                                                            ),
                                                            Text(
                                                              "Passenger",
                                                              style: AppStyles.semiBoldGilroyTextStyle()
                                                                  .copyWith(
                                                                    fontSize:
                                                                        16.sp,
                                                                  ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(height: 30.h),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        "Fare Bid \$${controller.rideDetail.value.offeredFare}",
                                                        style:
                                                            AppStyles.semiBoldGilroyTextStyle()
                                                                .copyWith(
                                                                  fontSize:
                                                                      26.sp,
                                                                ),
                                                      ),
                                                      SizedBox(width: 25.w),
                                                      Text(
                                                        formatRideDate(
                                                          controller
                                                              .rideDetail
                                                              .value
                                                              .createdAt,
                                                        ),
                                                        style:
                                                            AppStyles.regularGilroyTextStyle()
                                                                .copyWith(
                                                                  fontSize:
                                                                      26.sp,
                                                                ),
                                                      ),
                                                    ],
                                                  ),
                                                  // Spacer(),
                                                  // Row(
                                                  //   children: [
                                                  //     Expanded(
                                                  //       child: CustomButton(
                                                  //         title: "Update Ride",
                                                  //         onTap: () {},
                                                  //         width: 206.w,
                                                  //         height: 62.h,
                                                  //         textSize: 16,
                                                  //         fontWeight:
                                                  //             FontWeight.w400,
                                                  //         textColor:
                                                  //             kPrimaryColor,
                                                  //         color: kWhiteColor,
                                                  //         borderColor:
                                                  //             kPrimaryColor,
                                                  //       ),
                                                  //     ),
                                                  //     SizedBox(width: 22.w),
                                                  //     Expanded(
                                                  //       child: CustomButton(
                                                  //         title: "Send Message",
                                                  //         onTap: () {},
                                                  //         width: 206.w,
                                                  //         height: 62.h,
                                                  //       ),
                                                  //     ),
                                                  //   ],
                                                  // ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                          ),
                        ],
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
}
