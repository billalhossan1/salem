import 'package:core_kit/core_kit.dart';
import 'package:core_kit/network/request_input.dart';
import 'package:get/get.dart';

import '../../../core/api_endpoints/api_endpoints.dart';

class RedeemNowController extends GetxController{

  RxBool isRedeemLoading = false.obs;
  String redeemId  = '';

  @override
  void onInit() {
    redeemId = Get.arguments['redeemId']??'';
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

    }

  }
}