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
  String earning;
  bool isUserDetail;
  bool isDriver;
  bool isTopPerforming;
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
    this.earning = '',
    this.isUserDetail = false,
    this.isDriver = false,
    this.isTopPerforming = false,
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
        padding: EdgeInsets.symmetric(vertical: 30.h,),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  if(isTopPerforming == true)
                    CustomButton(title: "Top Performing", onTap: (){},color: kGreyColor16.withOpacity(0.11),borderColor: kWhiteColor,textSize: 8,height: 27,width: 80.w,textColor: kPrimaryColor,)
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 35.w),
              child: Column(
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
                            Text(isDriver == true ? "Earning" : "Payments",style: AppStyles.regularGilroyTextStyle().copyWith(
                                fontSize: 16.sp
                            ),),
                            Text(isDriver == true ? "\$$earning" : paymentStatus,style: AppStyles.semiBoldGilroyTextStyle().copyWith(
                                fontSize: 14.sp,
                              color: isDriver == true ? kGreenColor : kBlackColor
                            ),),
                          ],
                        ),
                      ],
                    ),
                  ),
                  CustomButton(title: isUserDetail == true ? "Suspend Profile" : "View Profile", onTap: onViewProfile ,height: 56.h,)

                ],
              ),
            )
            ],
        ),
      ),
    );
  }
}
