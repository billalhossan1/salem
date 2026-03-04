import 'package:core_kit/core_kit.dart';
import 'package:core_kit/network/request_input.dart';
import 'package:zena_app/core/api_endpoints/api_endpoints.dart';

import '../model/rewards_item_model.dart';

class HomeRepo {
   Future<ResponseState<List<RewardsItemModel>?>> getAllRewards() async {
return DioService.instance.request(
      input: RequestInput(
        endpoint: ApiEndpoints.getRewards,
        method: RequestMethod.GET,
      ),
      responseBuilder: (data) {
        return (data as List<dynamic>).map((e) => RewardsItemModel.fromJson(e)).toList();
      },

    );
  }


  Future<ResponseState<RewardsItemModel?>> getSingleReward({required String rewardId}) async {
return DioService.instance.request(
      input: RequestInput(
        endpoint: '${ApiEndpoints.getRewards}/$rewardId',
        method:.GET,
      ),
      responseBuilder: (data) {
        return RewardsItemModel.fromJson(data);
      },

    );
  }
}
