import 'package:flutter/material.dart';
import 'package:image_network/image_network.dart';
import 'package:lahakni_web/utils/app_images.dart';

class CustomImageWidget extends StatelessWidget {
  final String imageUrl;
  final double height;
  final double width;
  const CustomImageWidget({
    super.key,
    required this.imageUrl,
    this.height = 150,
    this.width = 150,
  });

  @override
  Widget build(BuildContext context) {
    return ImageNetwork(
      image: imageUrl,
      height: height,
      width: width,
      fitWeb: BoxFitWeb.cover,
      fitAndroidIos: BoxFit.cover,
      onLoading: const CircularProgressIndicator(strokeWidth: 2),
      onError: Image.asset(kDummyImg, fit: BoxFit.cover),
    );
  }
}
