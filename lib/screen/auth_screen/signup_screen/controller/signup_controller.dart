import 'package:core_kit/core_kit.dart';
import 'package:core_kit/network/request_input.dart';
import 'package:get/state_manager.dart';
import 'package:zena_app/screen/auth_screen/signup_screen/entity/signup_entity.dart';

class SignupController extends GetxController {
  void signup(SignupEntity signupEntity) async{
    final result = await DioService.instance.request<dynamic>(
      // showMessage: true,
      // debug: true,
      input: RequestInput(endpoint: '', method: RequestMethod.POST, ),
      responseBuilder: (data) {
        return data;
      },
    );

    if(result.isSuccess){
      
    }


  }
}
