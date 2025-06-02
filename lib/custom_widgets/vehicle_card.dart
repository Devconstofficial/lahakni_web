import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_colors.dart';
import '../utils/app_images.dart';
import '../utils/app_styles.dart';
import 'custom_button.dart';

class VehicleCard extends StatelessWidget {
  String image;
  String name;
  String price;
  String speed;
  String rating;
  String reviews;
  String status;
  VoidCallback onViewDetail;
  VehicleCard({
    super.key,
    required this.image,
    this.name = '',
    this.price = '',
    this.speed = '',
    this.rating = '',
    this.reviews = '',
    this.status = '',
    required this.onViewDetail,
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  name,
                  style:
                  AppStyles.semiBoldGilroyTextStyle()
                      .copyWith(
                    fontSize: 24.sp,
                  ),
                ),
                Row(
                  spacing: 6,
                  children: [
                    Image.asset(kStarIcon,height: 17,width: 17,),
                    Text(
                      "$rating ($reviews)",
                      style:
                      AppStyles.semiBoldGilroyTextStyle()
                          .copyWith(
                        fontSize: 16.sp,
                      ),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(height: 76.h,),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 139.h,
              child: Image.asset(image,fit: BoxFit.contain,),
            ),
            SizedBox(height: 28.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  spacing: 5,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomButton(title: status, onTap: (){},width: 115,height: 35,borderRadius: 8,color: kGreyColor8.withOpacity(0.33),borderColor: kWhiteColor,textSize: 13,textColor: kBlackColor,),
                    Text(
                      "\$$price",
                      style:
                      AppStyles.semiBoldGilroyTextStyle()
                          .copyWith(
                        fontSize: 15.sp,
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "$speed Speed",
                          style:
                          AppStyles.semiBoldGilroyTextStyle()
                              .copyWith(
                            fontSize: 15.sp,
                          ),
                        ),
                        Text(
                          "Lorem ispum Few",
                          style:
                          AppStyles.semiBoldGilroyTextStyle()
                              .copyWith(
                            fontSize: 15.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 27.h,),
            CustomButton(title: "View Detail", onTap: onViewDetail ,height: 68.h,)
          ],
        ),
      ),
    );
  }
}
