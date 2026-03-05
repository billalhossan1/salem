
import 'package:core_kit/core_kit.dart';
import 'package:core_kit/network/request_input.dart';
import 'package:get/get.dart';
import '../../../core/api_endpoints/api_endpoints.dart';
import '../model/salon_item_model.dart';

class SalonScreenController extends GetxController {
  var selectedTab = "Nearest".obs;
  RxBool isLoading = false.obs;
  Debouncer debouncer = Debouncer(milliseconds: 300);
  String search = '';
  RxList<SalonItemModel> allSalonList = <SalonItemModel>[].obs;


  void onSearch(String value) {
    debouncer.run(() {
      allSalonList.clear();
      allSalonList.refresh();
      search = value;
      getSalonList( );
    });
  }

  void selectTab(String tab) {
    selectedTab.value = tab;
  }



  @override
  void onInit() {
    super.onInit();
    getSalonList();
  }

  Future<void> getSalonList({int page =1}) async {
    isLoading.value = true;
    final response = await DioService.instance.request(
      input: RequestInput(
        endpoint: ApiEndpoints.salonList,
        method: .GET,
        queryParams: {
          if(search.isNotEmpty)'searchTerm': search,
          'page':page,
           'limit':10
        },
      ),
      responseBuilder: (data) {
        final list = (data as List<dynamic>)
            .map((e) => SalonItemModel.fromJson(e))
            .toList();
        allSalonList.addAll(list);
      },
    );
    isLoading.value = false;

    if (response.isSuccess) {
    } else {
      showSnackBar(response.message ?? '', type: SnackBarType.error);
    }
  }
}
