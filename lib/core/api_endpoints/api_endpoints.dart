String _domain = "http://10.10.7.104:4005";
final String _baseUrl = "$_domain/api/v1";


class ApiEndpoints {
  ApiEndpoints._();
  static String get baseUrl => _baseUrl;
  static String get domain => _domain;
  static const String refreshToken = "";



  static final String login = "/auth/login";
  static final String getRewards = "/salon-reward";
  static final String getUserCoin = "/user/coins";
  static final String globalReward = "/salon-reward/global-reward";
  static final String getUsedReward = "/reward/used";
  static final String getRewardHistory = "/salon-reward/purchase-view-history";
  static final String redeemNow = "/salon-reward/claim";
  static final String salonList = "/salon";
}