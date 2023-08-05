const baseUrl = 'https://parseapi.back4app.com/functions';

abstract class Endpoints {
  static const signin = '$baseUrl/login';
  static const signup = '$baseUrl/signup';
  static const changePassword = '$baseUrl/change-password';
  static const validateToken = '$baseUrl/validate-token';
  static const resetPassword = '$baseUrl/reset-password';
}