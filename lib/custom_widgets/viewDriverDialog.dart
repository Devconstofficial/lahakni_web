import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../utils/app_colors.dart';
import '../utils/app_images.dart';
import '../utils/app_styles.dart';
import 'custom_button.dart';
import 'custom_dialog.dart';
import 'custom_row.dart';



customImageContainer(title){

  return Container(
    height: 93,
    width: 124.w,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
            color: kBlackTextColor1.withOpacity(0.12)
        )
    ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(kGalleryIcon1,height: 40,width: 40,),
        Text(
          title,
          style:
          AppStyles.semiBoldGilroyTextStyle()
              .copyWith(
              fontSize: 12.sp,
              fontWeight: FontWeight.w600
          ),
        ),

      ],
    ),
  );
}

Widget viewDriverDialog(context,Map<String, dynamic> user){
  double width = MediaQuery.of(context).size.width;

  return CustomDialog(
    horPadding: 53,
    width: 626.w,
    content: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 30.h,),
          Container(
            width: width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                border: Border.all(
                    color: kBlackTextColor1.withOpacity(0.12)
                )
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 53,horizontal: 41),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        height: 130,
                        width: 130,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14)
                        ),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(14),
                            child: Image.asset(user['image'],fit: BoxFit.cover,)),
                      ),
                      SizedBox(width: 9,),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              user['name'],
                              style:
                              AppStyles.semiBoldGilroyTextStyle()
                                  .copyWith(
                                fontSize: 24.sp,
                              ),
                            ),
                            Text(
                              user['role'],
                              style:
                              AppStyles.semiBoldGilroyTextStyle()
                                  .copyWith(
                                fontSize: 16.sp,
                              ),
                            ),
                            Text(
                              user['number'] ?? "+9212345678910",
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
                ],
              ),
            ),
          ),
          SizedBox(height: 39.h),
          Container(
            width: width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                border: Border.all(
                    color: kBlackTextColor1.withOpacity(0.12)
                )
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 53,horizontal: 41),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
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
                      customRow("Car Plate Number", user['plateNumber']),
                      customRow("Car Model", user['model']),
                      customRow("Car Make", user['makeYear']),
                      customRow("Car Model Year", user['modelYear']),
                    ],
                  ),
                  SizedBox(height: 43,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      customImageContainer("Front"),
                      customImageContainer("Back"),
                      customImageContainer("Selfie"),
                    ],
                  ),
                  SizedBox(height: 25,),
                ],
              ),
            ),
          ),
          SizedBox(height: 65.h),
          Row(
            children: [
              Expanded(child: CustomButton(title: "Reject", onTap: (){
                Get.back();
              },color: kWhiteColor,textColor: kPrimaryColor,textSize: 16,height: 66,)),
              SizedBox(width: 20.w,),
              Expanded(child: CustomButton(title: "Approve", onTap: (){
                Get.back();

              },height: 66,))
            ],
          )

        ],
      ),
    ),
    showTitle: true,
    title: "Driver Documents",
  );
}