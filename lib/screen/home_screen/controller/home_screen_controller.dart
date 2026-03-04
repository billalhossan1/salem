import 'package:core_kit/core_kit.dart';
import 'package:get/get.dart';
import 'package:zena_app/screen/home_screen/model/rewards_item_model.dart';
import 'package:zena_app/screen/home_screen/repo/home_repo.dart';
import 'package:zena_app/utils/app_images/app_images.dart';

class HomeScreenController extends GetxController {
  final homeRepo = HomeRepo();

  RxList<RewardsItemModel> rewardList = <RewardsItemModel>[].obs;
  RxBool isRewardLoading = false.obs;
  @override
  void onInit() {
    getRewards();
    super.onInit();
  }

  final List<Map<String, String>> exclusiveOffers = [
    {
      "image": AppImages.homeImage1,
      "title": "20% off Hairstyles",
      "subtitle": "Valid Until Friday",
    },
    {
      "image": AppImages.homeImage2,
      "title": "Free Manicure",
      "subtitle": "With any hair color",
    },
    {
      "image": AppImages.homeImage3,
      "title": "15% off Facials",
      "subtitle": "Weekend Special",
    },
  ];

  Future<void> getRewards() async {
    isRewardLoading.value = true;
    final result = await homeRepo.getAllRewards();
    isRewardLoading.value = false;

    if (result.isSuccess) {
      rewardList.addAll(result.data ?? []);
      AppLogger.apiDebug(rewardList[0].rewardName.toString());
    }
  }
}
