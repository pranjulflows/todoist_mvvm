

class ApiConfig {
  ApiConfig._();

  static const token ="fd6aed3d7cf1e3630ef20d7e19f2d81e34102160"; /// test Token can be replaced with prod token.
  static const String baseUrl = "https://api.todoist.com/rest/v2";
  static const Duration receiveTimeout = Duration(milliseconds: 15 * 1000);
  static const Duration connectionTimeout = Duration(milliseconds: 15 * 1000);
  static const String tasks = '/users';
  static const String projectId = '2334848817'; /// default projectId
  static const String projects = '/projects';

  static const header = {
    'Authorization': 'Bearer $token',
    'content-Type': 'application/json',
  };
}
