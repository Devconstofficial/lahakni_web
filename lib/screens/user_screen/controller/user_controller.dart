import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lahakni_web/custom_widgets/custom_snackbar.dart';
import 'package:lahakni_web/models/customer_model.dart';
import 'package:lahakni_web/models/ride_model.dart';
import 'package:lahakni_web/services/customer_service.dart';

class UserController extends GetxController {
  final CustomerService _service = CustomerService();
  var isLoading = false.obs;
  var isError = false.obs;
  var errorMsg = "".obs;
  var isLoading1 = false.obs;
  var isError1 = false.obs;
  var errorMsg1 = "".obs;
  RxList<CustomerModel> customers = <CustomerModel>[].obs;
  Rx<CustomerModel> customerDetail = CustomerModel.empty().obs;
  RxList<RideModel> rides = <RideModel>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getCustomers();
  }

  void getCustomers() async {
    try {
      isLoading(true);
      var result = await _service.getCustomers();
      isLoading(false);
      if (result is List<CustomerModel>) {
        customers.assignAll(result);
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

  void suspendCustomer(String id, bool value) async {
    try {
      Get.dialog(
        const Center(child: CircularProgressIndicator()),
        barrierDismissible: false,
      );
      var result = await _service.suspendCustomer(id: id, value: value);
      Get.back();
      if (result is CustomerModel) {
        Get.back();
        customerDetail.value.isSuspend = result.isSuspend;
        customerDetail.refresh();
        showCustomSnackbar(
          "Success",
          value == true
              ? "User suspended successfully"
              : "User reactivated successfully",
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

  void geCustomerDetail(String id) async {
    try {
      isLoading1(true);
      var result = await _service.getCustomerDetail(id: id);
      isLoading1(false);
      if (result is CustomerModel) {
        customerDetail.value = result;
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

  var currentPage = 1.obs;
  final int itemsPerPage = 6;
  final int pagesPerGroup = 4;

  int get totalPages => (customers.length / itemsPerPage).ceil();

  List<CustomerModel> get pagedUsers {
    int start = (currentPage.value - 1) * itemsPerPage;
    int end = start + itemsPerPage;
    return customers.sublist(
      start,
      end > customers.length ? customers.length : end,
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
