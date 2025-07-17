import 'package:get/get.dart';
import 'package:lahakni_web/models/ride_report_model.dart';
import 'package:lahakni_web/models/support_model.dart';
import 'package:lahakni_web/services/support_service.dart';

class SupportController extends GetxController {
  final SupportService _service = SupportService();
  var isLoading = false.obs;
  var isError = false.obs;
  var errorMsg = "".obs;
  var isLoading1 = false.obs;
  var isError1 = false.obs;
  var errorMsg1 = "".obs;
  RxList<RideReportModel> rideIssues = <RideReportModel>[].obs;
  RxList<SupportModel> supportMessages = <SupportModel>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getAll();
  }

  getAll() {
    Future.wait([getRideIssues(), getSupportMessages()]);
  }

  Future getSupportMessages() async {
    try {
      isLoading1(true);
      var result = await _service.getAllSupportMessages();
      isLoading1(false);
      if (result is List<SupportModel>) {
        supportMessages.assignAll(result);
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

  Future getRideIssues() async {
    try {
      isLoading(true);
      var result = await _service.getAllRideIssues();
      isLoading(false);
      if (result is List<RideReportModel>) {
        rideIssues.assignAll(result);
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

  var currentPage = 1.obs;
  final int itemsPerPage = 6;
  final int pagesPerGroup = 4;

  int get totalPages => (rideIssues.length / itemsPerPage).ceil();

  List<RideReportModel> get pagedUsers {
    int start = (currentPage.value - 1) * itemsPerPage;
    int end = start + itemsPerPage;
    return rideIssues.sublist(
      start,
      end > rideIssues.length ? rideIssues.length : end,
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
