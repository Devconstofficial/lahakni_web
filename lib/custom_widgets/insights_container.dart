import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/app_colors.dart';
import '../utils/app_images.dart';
import '../utils/app_styles.dart';

class InsightsContainer extends StatelessWidget {
  String title1;
  String title2;
  String title3;
  String detail1;
  String detail2;
  String detail3;
  String avg1;
  String avg2;
  String avg3;
  String avgWeekly1;
  String avgWeekly2;
  String avgWeekly3;
  String image1;
  String image2;
  String image3;
  String arrow1;
  String arrow2;
  String arrow3;

  InsightsContainer({
    super.key,
    required this.title1,
    required this.title2,
    required this.title3,
    required this.detail1,
    required this.detail2,
    required this.detail3,
    required this.avg1,
    required this.avg2,
    required this.avg3,
    required this.avgWeekly1,
    required this.avgWeekly2,
    required this.avgWeekly3,
    required this.image1,
    required this.image2,
    required this.image3,
    required this.arrow1,
    required this.arrow2,
    required this.arrow3,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Container(
      width: width,
      decoration: BoxDecoration(
        color: kWhiteColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: kGreyColor3
        )
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 22,horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 205.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 2.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              detail1,
                              style: AppStyles.blackTextStyle().copyWith(
                                fontSize: 28.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              title1,
                              style: AppStyles.blackTextStyle().copyWith(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 44,
                        width: 44,
                        decoration: BoxDecoration(
                          color: kWhiteColor,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: kGreyColor4.withOpacity(0.12),
                              blurRadius: 10,
                              spreadRadius: 0,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Center(child: SvgPicture.asset(image1,height: 24,width: 24,)),
                      )
                    ],
                  ),
                  SizedBox(height: 12,),
                  Row(
                    children: [
                      SvgPicture.asset(kArrowUpIcon,height: 20,width: 20,),
                      SizedBox(width: 8.w,),
                      Text(
                        avg1,
                        style: AppStyles.greyTextStyle().copyWith(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: kGreyColor4
                        ),
                      ),
                      SizedBox(width: 12.w,),
                      Text(
                        avgWeekly1,
                        style: AppStyles.greyTextStyle().copyWith(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: kGreyColor4
                        ),
                      ),

                    ],
                  )
                ],
              ),
            ),
            Container(
              width: 1,
              height: 110,
              color: kGreyColor3,
            ),
            SizedBox(
              width: 205.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 2.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              detail2,
                              style: AppStyles.blackTextStyle().copyWith(
                                fontSize: 28.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              title2,
                              style: AppStyles.blackTextStyle().copyWith(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 44,
                        width: 44,
                        decoration: BoxDecoration(
                          color: kWhiteColor,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: kGreyColor4.withOpacity(0.12),
                              blurRadius: 10,
                              spreadRadius: 0,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Center(child: SvgPicture.asset(image2,height: 24,width: 24,)),
                      )
                    ],
                  ),
                  SizedBox(height: 12,),
                  Row(
                    children: [
                      SvgPicture.asset(arrow2,height: 20,width: 20,),
                      SizedBox(width: 8.w,),
                      Text(
                        avg2,
                        style: AppStyles.greyTextStyle().copyWith(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: kGreyColor4
                        ),
                      ),
                      SizedBox(width: 12.w,),
                      Text(
                        avgWeekly2,
                        style: AppStyles.greyTextStyle().copyWith(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: kGreyColor4
                        ),
                      ),

                    ],
                  )
                ],
              ),
            ),
            Container(
              width: 1,
              height: 110,
              color: kGreyColor3,
            ),
            SizedBox(
              width: 205.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 2.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              detail3,
                              style: AppStyles.blackTextStyle().copyWith(
                                fontSize: 28.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              title3,
                              style: AppStyles.blackTextStyle().copyWith(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 44,
                        width: 44,
                        decoration: BoxDecoration(
                          color: kWhiteColor,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: kGreyColor4.withOpacity(0.12),
                              blurRadius: 10,
                              spreadRadius: 0,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Center(child: SvgPicture.asset(image3,height: 24,width: 24,)),
                      )
                    ],
                  ),
                  SizedBox(height: 12,),
                  Row(
                    children: [
                      SvgPicture.asset(arrow3,height: 20,width: 20,),
                      SizedBox(width: 8.w,),
                      Text(
                        avg3,
                        style: AppStyles.greyTextStyle().copyWith(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: kGreyColor4
                        ),
                      ),
                      SizedBox(width: 12.w,),
                      Text(
                        avgWeekly3,
                        style: AppStyles.greyTextStyle().copyWith(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: kGreyColor4
                        ),
                      ),

                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
