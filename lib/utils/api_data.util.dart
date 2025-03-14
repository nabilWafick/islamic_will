import 'package:dio/dio.dart';

class ApiData {
  final Dio dio = Dio();
  static String baseURL = 'https://agriwallet-backend.206.189.2.227.sslip.io';
  static String register = '/client-enrollments';
  static String login = '/auth/login';
  static String me = '/auth/me';
  static String myEnrollment = '/client-enrollments/my-enrollment';
  static String cities = '/cities';
  static String preAgreement = '/pre-agreements';
  static String producers = '/producers';
  static String cooperatives = '/cooperatives';
  static String wallets = '/wallets';
  static String regions = '/regions';
  static String crops = '/crops';
  static String historicals = '/historicals';
}
