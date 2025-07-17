import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lahakni_web/custom_widgets/custom_snackbar.dart';
import 'package:lahakni_web/models/customer_model.dart';
import 'package:lahakni_web/models/driver_detail_model.dart';
import 'package:lahakni_web/models/driver_model.dart';
import 'package:lahakni_web/models/ride_model.dart';
import 'package:lahakni_web/services/driver_service.dart';

class DriverController extends GetxController {
  final DriverService _service = DriverService();
  var isLoading = false.obs;
  var isError = false.obs;
  var errorMsg = "".obs;
  var isLoading1 = false.obs;
  var isError1 = false.obs;
  var errorMsg1 = "".obs;
  RxList<DriverModel> unapproveDrivers = <DriverModel>[].obs;
  Rx<DriverDetailModel> driverDetail = DriverDetailModel.empty().obs;
  RxList<RideModel> rides = <RideModel>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getUnApprovedDrivers();
  }

  void getUnApprovedDrivers() async {
    try {
      isLoading(true);
      var result = await _service.getUnApprovedDrivers();
      isLoading(false);
      if (result is List<DriverModel>) {
        unapproveDrivers.assignAll(result);
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

  void approveDriver(String id) async {
    try {
      Get.dialog(
        const Center(child: CircularProgressIndicator()),
        barrierDismissible: false,
      );
      var result = await _service.approveDriverStatus(id: id);
      Get.back();
      if (result is bool) {
        showCustomSnackbar(
          "Success",
          "Driver approved successfully",
          backgroundColor: Colors.green,
        );
        getUnApprovedDrivers();
        return;
      } else {
        showCustomSnackbar("Error", result.toString());
      }
    } catch (e) {
      Get.back();

      showCustomSnackbar("Error", e.toString());
    }
  }

  void rejectDriver(String id) async {
    try {
      Get.dialog(
        const Center(child: CircularProgressIndicator()),
        barrierDismissible: false,
      );
      var result = await _service.rejectDriverStatus(id: id);
      Get.back();
      if (result is bool) {
        showCustomSnackbar(
          "Success",
          "Driver rejected successfully",
          backgroundColor: Colors.green,
        );
        getUnApprovedDrivers();
        return;
      } else {
        showCustomSnackbar("Error", result.toString());
      }
    } catch (e) {
      Get.back();

      showCustomSnackbar("Error", e.toString());
    }
  }

  void getDriverDetail(String id) async {
    driverDetail.value = DriverDetailModel.empty();
    try {
      isLoading1(true);
      var result = await _service.getDriverDetail(id: id);
      isLoading1(false);
      if (result is DriverDetailModel) {
        driverDetail.value = result;
        rides.value = result.rides;
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

  void suspendDriver(String id, bool value) async {
    try {
      Get.dialog(
        const Center(child: CircularProgressIndicator()),
        barrierDismissible: false,
      );
      var result = await _service.suspendDiver(id: id, value: value);
      Get.back();
      if (result is CustomerModel) {
        Get.back();
        driverDetail.value.isSuspend = result.isSuspend;
        driverDetail.refresh();
        showCustomSnackbar(
          "Success",
          value == true
              ? "Driver suspended successfully"
              : "Driver reactivated successfully",
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
  final int itemsPerPage = 6;
  final int pagesPerGroup = 4;

  int get totalPages => (unapproveDrivers.length / itemsPerPage).ceil();

  List<DriverModel> get pagedUsers {
    int start = (currentPage.value - 1) * itemsPerPage;
    int end = start + itemsPerPage;
    return unapproveDrivers.sublist(
      start,
      end > unapproveDrivers.length ? unapproveDrivers.length : end,
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

  var currentPage2 = 1.obs;
  final int itemsPerPage2 = 6;
  final int pagesPerGroup2 = 4;

  int get totalPages2 => (rides.length / itemsPerPage2).ceil();

  List<RideModel> get pagedUsers2 {
    int start = (currentPage2.value - 1) * itemsPerPage2;
    int end = start + itemsPerPage2;
    return rides.sublist(start, end > rides.length ? rides.length : end);
  }

  int get currentGroup2 => ((currentPage2.value - 1) / pagesPerGroup2).floor();

  List<int> get visiblePageNumbers2 {
    int startPage = currentGroup2 * pagesPerGroup2 + 1;
    int endPage = (startPage + pagesPerGroup2 - 1).clamp(1, totalPages2);
    return List.generate(endPage - startPage + 1, (index) => startPage + index);
  }

  void goToPage2(int page) {
    if (page >= 1 && page <= totalPages2) currentPage2.value = page;
  }

  void goToNextPage2() {
    if (currentPage2.value < totalPages2) {
      currentPage2.value++;
    }
  }

  void goToPreviousPage2() {
    if (currentPage2.value > 1) {
      currentPage2.value--;
    }
  }
}
