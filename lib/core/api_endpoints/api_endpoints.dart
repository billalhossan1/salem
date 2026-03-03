String _domain = "http://10.10.7.104:4005";
final String _baseUrl = "$_domain/api/v1";


class ApiEndpoints {
  ApiEndpoints._();
  static String get baseUrl => _baseUrl;
  static String get domain => _domain;
  static const String refreshToken = "";
  static final String login = "/auth/login";
}