//step-4-p2
import 'package:dio/dio.dart';
import '../models/signIn/SignIn_response.dart';
import 'auth_remote_data_source.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final Dio dio;

  AuthRemoteDataSourceImpl({required this.dio});

  @override
  Future<SignInResponse> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final response = await dio.post(
        '/auth/signin',
        data: {
          'email': email,
          'password': password,
        },
      );
      print('API RESPONSE DATA: ${response.data}');
      return SignInResponse.fromJson(response.data);
    } on DioException catch (e) {
      print('Dio Error Response: ${e.response?.data}');
      final errorMessage = e.response?.data['message']?.toString() ?? 'Login failed';
      throw Exception(errorMessage);    }
  }
}
