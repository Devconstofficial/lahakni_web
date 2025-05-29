import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_colors.dart';
import '../utils/app_styles.dart';
import 'custom_button.dart';

class UserCard extends StatelessWidget {
  String image;
  String name;
  String status;
  String totalRides;
  String completedRides;
  String canceledRides;
  String paymentStatus;
  bool isUserDetail;
  VoidCallback onViewProfile;
  UserCard({
    super.key,
    required this.image,
    this.name = '',
    this.status = '',
    this.totalRides = '',
    this.completedRides = '',
    this.canceledRides = '',
    this.paymentStatus = '',
    this.isUserDetail = false,
    required this.onViewProfile,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: (MediaQuery.of(context).size.width) / 4.2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: kBlackColor.withOpacity(0.12)),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 30.h,horizontal: 35.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                          color: kGreyColor8
                      )
                  )
              ),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: Row(
                  children: [
                    Container(
                      height: 67,
                      width: 74,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14)
                      ),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(14),
                          child: Image.asset(image,fit: BoxFit.cover,)),
                    ),
                    SizedBox(width: 7,),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            name,
                            style:
                            AppStyles.semiBoldGilroyTextStyle()
                                .copyWith(
                              fontSize: 24.sp,
                            ),
                          ),
                          Text(
                            status,
                            style:
                            AppStyles.semiBoldGilroyTextStyle()
                                .copyWith(
                              fontSize: 16.sp,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 23.0,bottom: 44),
              child: Column(
                spacing: 24.h,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Total Rides",style: AppStyles.regularGilroyTextStyle().copyWith(
                          fontSize: 16.sp
                      ),),
                      Text("$totalRides rides",style: AppStyles.semiBoldGilroyTextStyle().copyWith(
                          fontSize: 14.sp
                      ),),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Completed Rides",style: AppStyles.regularGilroyTextStyle().copyWith(
                          fontSize: 16.sp
                      ),),
                      Text("$completedRides rides",style: AppStyles.semiBoldGilroyTextStyle().copyWith(
                          fontSize: 14.sp
                      ),),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Canceled Rides",style: AppStyles.regularGilroyTextStyle().copyWith(
                          fontSize: 16.sp
                      ),),
                      Text("$canceledRides rides",style: AppStyles.semiBoldGilroyTextStyle().copyWith(
                          fontSize: 14.sp
                      ),),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Payments",style: AppStyles.regularGilroyTextStyle().copyWith(
                          fontSize: 16.sp
                      ),),
                      Text(paymentStatus,style: AppStyles.semiBoldGilroyTextStyle().copyWith(
                          fontSize: 14.sp
                      ),),
                    ],
                  ),
                ],
              ),
            ),
            CustomButton(title: isUserDetail == true ? "Suspend Profile" : "View Profile", onTap: onViewProfile ,height: 56.h,)
          ],
        ),
      ),
    );
  }
}
