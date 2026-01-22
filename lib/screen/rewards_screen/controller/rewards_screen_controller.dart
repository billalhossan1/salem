import 'package:get/get.dart';
import 'package:zena_app/utils/app_images/app_images.dart';

class RewardModel {
  final String image;
  final String salonName;
  final String description;
  final int currentPoints;
  final int goalPoints;
  final String statusText;
  final bool isRewardReady;
  final String buttonText;
  final String? footerText;
  final String category;

  RewardModel({
    required this.image,
    required this.salonName,
    required this.description,
    required this.currentPoints,
    required this.goalPoints,
    required this.statusText,
    required this.isRewardReady,
    required this.buttonText,
    this.footerText,
    required this.category,
  });
}

class RewardsScreenController extends GetxController {
  //! Variables
  RxInt selectedCategoryIndex = 0.obs;
  var categoryList = ["All", "Hair", "Nails", "Skincare", "Makeup"];

  var rewardList = <RewardModel>[
    RewardModel(
      image: AppImages.rewardImage1,
      salonName: "Lush Locks Salon",
      description: "Your points at Lush Locks Salon",
      currentPoints: 55,
      goalPoints: 50,
      statusText: "YOU DESERVE THIS 💖",
      isRewardReady: true,
      buttonText: "Use my points",
      footerText: "Ready for a free treatment",
      category: "Hair",
    ),
    RewardModel(
      image: AppImages.rewardImage2,
      salonName: "Glow Spa",
      description: "Your points at Glow Spa",
      currentPoints: 35,
      goalPoints: 50,
      statusText: "15 POINTS REMAINING",
      isRewardReady: false,
      buttonText: "View History",
      category: "Skincare",
    ),
    RewardModel(
      image: AppImages.salonDetails,
      salonName: "Glow Spa",
      description: "Your points at Glow Spa",
      currentPoints: 35,
      goalPoints: 50,
      statusText: "15 POINTS REMAINING",
      isRewardReady: false,
      buttonText: "View History",
      category: "Skincare",
    ),
    RewardModel(
      image: AppImages.rewardImage1,
      salonName: "Nail Art Studio",
      description: "Your points at Nail Art Studio",
      currentPoints: 20,
      goalPoints: 50,
      statusText: "30 POINTS REMAINING",
      isRewardReady: false,
      buttonText: "View History",
      category: "Nails",
    ),
    RewardModel(
      image: AppImages.rewardImage2,
      salonName: "Pure Beauty Makeup",
      description: "Your points at Pure Beauty",
      currentPoints: 45,
      goalPoints: 50,
      statusText: "5 POINTS REMAINING",
      isRewardReady: false,
      buttonText: "View History",
      category: "Makeup",
    ),
  ].obs;

  List<RewardModel> get filteredRewardList {
    if (selectedCategoryIndex.value == 0) {
      return rewardList;
    }
    String selectedCategory = categoryList[selectedCategoryIndex.value];
    return rewardList
        .where((reward) => reward.category == selectedCategory)
        .toList();
  }

  void selectCategory(int index) {
    selectedCategoryIndex.value = index;
  }
}
