import 'dart:convert';
import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lahakni_web/custom_widgets/custom_snackbar.dart';
import 'package:lahakni_web/models/customer_model.dart';
import 'package:lahakni_web/models/user_model.dart';
import 'package:lahakni_web/services/auth_service.dart';
import 'package:lahakni_web/services/dashboard_service.dart';
import 'package:lahakni_web/services/driver_service.dart';
import 'package:lahakni_web/utils/session_management/session_management.dart';
import 'package:lahakni_web/utils/session_management/session_token_keys.dart';
import '../../../utils/app_colors.dart';

class DashboardController extends GetxController {
  final DriverService _service = DriverService();
  final DashboardService _dashboardService = DashboardService();
  final AuthService _authService = AuthService();
  static final FirebaseStorage _storage = FirebaseStorage.instance;
  var isLoading = false.obs;
  var isError = false.obs;
  var errorMsg = "".obs;
  var isLoading1 = false.obs;
  var isError1 = false.obs;
  var errorMsg1 = "".obs;
  var isLoading2 = false.obs;
  var isError2 = false.obs;
  var errorMsg2 = "".obs;
  var totalUsers = "0".obs;
  var totalRides = "0".obs;
  var totalDrivers = "0".obs;
  RxString selectedOption = "Monthly".obs;
  List<String> options = ["Monthly", "Yearly"];
  void selectOption(String option) {
    selectedOption.value = option;
    getRideStats();
  }

  final yInterval = 20;
  var months = [].obs;

  var completedSpots = <FlSpot>[].obs;

  var pendingSpots = <FlSpot>[].obs;
  Rx<UserModel> userData = UserModel.empty().obs;
  Rx<Uint8List?> webImage = Rxn<Uint8List>();
  var nameCont = TextEditingController();

  LineChartBarData get completedLine => LineChartBarData(
    spots: completedSpots,
    isCurved: true,
    color: kBlackColor,
    barWidth: 2,
    dotData: FlDotData(show: false),
    belowBarData: BarAreaData(show: false),
  );

  LineChartBarData get pendingLine => LineChartBarData(
    spots: pendingSpots,
    isCurved: true,
    color: kGreyColor5,
    barWidth: 2,
    dotData: FlDotData(show: false),
    belowBarData: BarAreaData(show: false),
  );

  List<LineChartBarData> get lineBars => [completedLine, pendingLine];
  RxList<CustomerModel> activeDrivers = <CustomerModel>[].obs;
  RxList<CustomerModel> filteredDrivers = <CustomerModel>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getUserData();
    getAll();
  }

  getAll() {
    Future.wait([getStats(), getActiveDrivers(), getRideStats()]);
  }

  Future getActiveDrivers() async {
    try {
      isLoading(true);
      var result = await _service.getActiveDrivers();
      isLoading(false);
      if (result is List<CustomerModel>) {
        activeDrivers.assignAll(result);
        filteredDrivers.assignAll(result);
        isError(false);
        errorMsg.value = '';
        return;
      } else {
        isError(true);
        errorMsg.value = result.toString();
      }
    } catch (e) {
      isLoading(false);
      isError(true);
      errorMsg.value = e.toString();
    }
  }

  Future getStats() async {
    try {
      isLoading1(true);
      var result = await _dashboardService.getStats();
      isLoading1(false);
      if (result is Map<String, dynamic>) {
        totalUsers.value = result['users']['count'].toString();
        totalDrivers.value = result['drivers']['count'].toString();
        totalRides.value = result['rides']['totalCompleted'].toString();
        isError1(false);
        errorMsg1.value = '';
        return;
      } else {
        isError1(true);
        errorMsg1.value = result.toString();
      }
    } catch (e) {
      isLoading1(false);
      isError1(true);
      errorMsg1.value = e.toString();
    }
  }

  Future getRideStats() async {
    try {
      isLoading2(true);
      var result = await _dashboardService.getRideStats(
        type: selectedOption.value.toLowerCase(),
      );

      if (result is Map<String, dynamic>) {
        final String type = selectedOption.value.toLowerCase();
        final List<dynamic> data = result[type] ?? [];
        completedSpots.clear();
        pendingSpots.clear();
        months.clear();

        for (int i = 0; i < data.length; i++) {
          final entry = data[i];

          double x = i.toDouble();
          double completedY = (entry['completed'] ?? 0).toDouble();
          double cancelledY = (entry['cancelled'] ?? 0).toDouble();

          completedSpots.add(FlSpot(x, completedY));
          pendingSpots.add(FlSpot(x, cancelledY));

          if (type == 'monthly') {
            months.add(entry['day'].toString());
          } else {
            months.add(entry['month']);
          }
        }
        isLoading2(false);
        isError2(false);
        errorMsg2.value = '';
        return;
      } else {
        isLoading2(false);
        isError2(true);
        errorMsg2.value = result.toString();
      }
    } catch (e) {
      isLoading2(false);
      isError2(true);
      errorMsg2.value = e.toString();
    }
  }

  void searchDrivers(String query) {
    if (query.isEmpty) {
      filteredDrivers.assignAll(activeDrivers);
    } else {
      filteredDrivers.assignAll(
        activeDrivers.where(
          (driver) =>
              driver.username.toLowerCase().contains(query.toLowerCase()),
        ),
      );
    }

    currentPage.value = 1;
  }

  void getUserData() async {
    String userJson = await SessionManagement().getSessionToken(
      tokenKey: SessionTokenKeys.kUserModelKey,
    );

    if (userJson.isNotEmpty && userJson != "null") {
      try {
        var decoded = jsonDecode(userJson);
        if (decoded is Map<String, dynamic>) {
          userData.value = UserModel.fromJson(decoded);
          userData.refresh();
        } else {
          print("Decoded user data is not a valid map: $decoded");
        }
      } catch (e) {
        print("Error decoding user data: $e");
      }
    } else {
      print("No valid user data found");
    }
  }

  Future<void> pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      final bytes = await pickedFile.readAsBytes();

      webImage.value = bytes;
    }
  }

  Future<dynamic> uploadCategoryImage(dynamic imageBytes) async {
    try {
      String filePath = 'admin/${DateTime.now().millisecondsSinceEpoch}.png';

      UploadTask uploadTask;

      uploadTask = _storage.ref(filePath).putData(imageBytes);

      TaskSnapshot snapshot = await uploadTask;

      String downloadUrl = await snapshot.ref.getDownloadURL();

      return downloadUrl;
    } catch (e) {
      return false;
    }
  }

  void updateProfile() async {
    try {
      String imageUrl = "";
      Get.dialog(
        const Center(child: CircularProgressIndicator()),
        barrierDismissible: false,
      );
      if (webImage.value != null) {
        var result = await uploadCategoryImage(webImage.value);
        if (result is bool) {
          Get.back();
          showCustomSnackbar("Error", "Failed to upload image");
          return;
        } else {
          imageUrl = result;
        }
      }
      var result = await _authService.updateProfile(
        body: {
          "username": nameCont.text,
          if (imageUrl.isNotEmpty) "profileImage": imageUrl,
        },
      );
      Get.back();
      if (result is UserModel) {
        Get.back();
        getUserData();
        showCustomSnackbar(
          "Success",
          "Profile updated successfully",
          backgroundColor: Colors.green,
        );
        return;
      } else {
        showCustomSnackbar("Error", result.toString());
      }
    } catch (e) {
      Get.back();
      showCustomSnackbar("Error", e.toString());
    }
  }

  var currentPage = 1.obs;
  final int itemsPerPage = 3;
  final int pagesPerGroup = 4;

  int get totalPages => (filteredDrivers.length / itemsPerPage).ceil();

  List<CustomerModel> get pagedUsers {
    int start = (currentPage.value - 1) * itemsPerPage;
    int end = start + itemsPerPage;
    return filteredDrivers.sublist(
      start,
      end > filteredDrivers.length ? filteredDrivers.length : end,
    );
  }

  int get currentGroup => ((currentPage.value - 1) / pagesPerGroup).floor();

  List<int> get visiblePageNumbers {
    int startPage = currentGroup * pagesPerGroup + 1;
    int endPage = (startPage + pagesPerGroup - 1).clamp(1, totalPages);
    return List.generate(endPage - startPage + 1, (index) => startPage + index);
  }

  void goToPage(int page) {
    if (page >= 1 && page <= totalPages) currentPage.value = page;
  }

  void goToNextPage() {
    if (currentPage.value < totalPages) {
      currentPage.value++;
    }
  }

  void goToPreviousPage() {
    if (currentPage.value > 1) {
      currentPage.value--;
    }
  }
}
