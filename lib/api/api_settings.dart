class ApiSettings {
  static const String _baseUrlDemo = 'http://demo-api.mr-dev.tech/';
  static const String baseApiUrlDemo = '${_baseUrlDemo}api/';
  static const String login = '${baseApiUrlDemo}students/auth/login';
  static const String logout = '${baseApiUrlDemo}students/auth/logout';
  static const String register = '${baseApiUrlDemo}students/auth/register';
  static const String forget = '${baseApiUrlDemo}students/auth/forget-password';
  static const String resetPassword =
      '${baseApiUrlDemo}students/auth/reset-password';
  static const String _baseUrl =
      'https://newsapi.org/v2/top-headlines?country=us&category=';
  static const String _baseUrl2 = '&apiKey=0dec0a33a62542f7b6e6c00b48dfed79';
  static const String business = '${_baseUrl}business$_baseUrl2';
  static const String entertainment = '${_baseUrl}entertainment$_baseUrl2';
  static const String health = '${_baseUrl}health$_baseUrl2';
  static const String science = '${_baseUrl}science$_baseUrl2';
  static const String sports = '${_baseUrl}sports$_baseUrl2';
  static const String technology = '${_baseUrl}technology$_baseUrl2';
}
