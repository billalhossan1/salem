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
  });
}

class RewardsScreenController extends GetxController {
  //! Variables

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
    ),
  ].obs;
}
