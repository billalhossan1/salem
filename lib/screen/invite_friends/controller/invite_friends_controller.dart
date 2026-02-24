import 'package:get/get.dart';

class InviteFriendsController extends GetxController {
  RxBool isInviteFriendsEnabled = true.obs;

  // Track number of friends who completed their first visit (0-3)
  RxInt completedReferrals = 0.obs;

  // Check if reward is ready (3 referrals completed)
  bool get isRewardReady => completedReferrals.value >= 3;

  // Get remaining referrals needed
  int get remainingReferrals => 3 - completedReferrals.value;

  // Simulate a friend completing their visit (for testing)
  void simulateReferralComplete() {
    if (completedReferrals.value < 3) {
      completedReferrals.value++;
    }
  }

  // Reset referrals (after claiming reward)
  void resetReferrals() {
    completedReferrals.value = 0;
  }
}
