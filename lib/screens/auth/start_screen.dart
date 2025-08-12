import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lahakni_web/utils/app_strings.dart';
import 'package:lahakni_web/utils/session_management/session_management.dart';
import 'package:lahakni_web/utils/session_management/session_token_keys.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  final SessionManagement _sessionManagement = SessionManagement();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _checkSessionAndNavigate();
    });
  }

  void _checkSessionAndNavigate() async {
    // final isRemember = await _sessionManagement.getBoolSession(
    //   tokenKey: SessionTokenKeys.kIsRememberMeKey,
    // );

    // if (isRemember == true) {
    //   Get.offAllNamed(kDashboardScreenRoute);
    // } else {
    //   Get.offAllNamed(kAuthScreenRoute);
    // }
    final authToken = await _sessionManagement.getSession(
      SessionTokenKeys.kUserTokenKey,
    );

    if (authToken != null && authToken.isNotEmpty) {
      Get.offAllNamed(kDashboardScreenRoute);
    } else {
      Get.offAllNamed(kAuthScreenRoute);
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}
