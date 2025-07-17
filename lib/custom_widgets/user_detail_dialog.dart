import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_network/image_network.dart';
import 'package:lahakni_web/custom_widgets/custom_button.dart';
import 'package:lahakni_web/custom_widgets/custom_textfield.dart';
import 'package:lahakni_web/screens/dashboard_screen/controller/dashboard_controller.dart';
import 'package:lahakni_web/utils/app_colors.dart';
import 'package:lahakni_web/utils/app_images.dart';

class UpdateDetailsDialog extends StatefulWidget {
  const UpdateDetailsDialog({super.key});

  @override
  State<UpdateDetailsDialog> createState() => _UpdateDetailsDialogState();
}

class _UpdateDetailsDialogState extends State<UpdateDetailsDialog> {
  final DashboardController controller = Get.find();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.webImage.value = null;
    controller.nameCont.text = controller.userData.value.name;
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: kWhiteColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: SizedBox(
        width: 521.w,
        height: 500.h,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 50.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Obx(
                () => CircleAvatar(
                  radius: 50,
                  child: ClipOval(
                    child:
                        controller.webImage.value != null
                            ? GestureDetector(
                              onTap: () {
                                controller.pickImage();
                              },
                              child: Image.memory(
                                controller.webImage.value!,
                                fit: BoxFit.cover,
                                height: 100,
                                width: 100,
                              ),
                            )
                            : ImageNetwork(
                              image: controller.userData.value.userImage,
                              height: 100,
                              width: 100,
                              onTap: () {
                                controller.pickImage();
                              },
                              fitWeb: BoxFitWeb.cover,
                              fitAndroidIos: BoxFit.cover,
                              onLoading: const CircularProgressIndicator(
                                strokeWidth: 2,
                              ),
                              onError: Image.asset(
                                kDummyImg,
                                fit: BoxFit.cover,
                              ),
                            ),
                  ),
                ),
              ),
              SizedBox(height: 24.h),
              CustomTextField(
                controller: controller.nameCont,
                hintText: "Enter name",
                borderRadius: 20,
                isFilled: true,
                fillColor: kGreyColor11,
                hintColor: kBlackColor,
              ),
              SizedBox(height: 44.h),
              Center(
                child: CustomButton(
                  height: 60,
                  textSize: 15,
                  borderRadius: 8,
                  title: "Update",
                  onTap: () {
                    controller.updateProfile();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
