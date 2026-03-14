import 'package:core_kit/core_kit.dart';
import 'package:core_kit/network/request_input.dart';
import 'package:get/get.dart';
import 'package:zena_app/core/app_route/app_route.dart';

import '../../../core/api_endpoints/api_endpoints.dart';

class RedeemNowController extends GetxController{

  RxBool isRedeemLoading = false.obs;
  String redeemId  = '';
  int myPoint = 0;
  int pointRequired = 0;

  @override
  void onInit() {
    redeemId = Get.arguments['redeemId']??'';
    myPoint = Get.arguments['myPoint']??0;
    pointRequired = Get.arguments['pointRequired']??0;

    super.onInit();
  }
  Future<void> redeemNow()async{
    isRedeemLoading.value = true;
    final response = await DioService.instance.request(
      input: RequestInput(
        endpoint: "${ApiEndpoints.redeemNow}/$redeemId",
        method: .POST,
      ),
      responseBuilder: (data) {

      },
      showMessage: true

    );
    isRedeemLoading.value = false;
    if(response.isSuccess){
      Get.offAllNamed(AppRoute.bottomNav);
    }
  }
}