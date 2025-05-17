//step-4-p1
import '../models/signIn/SignIn_response.dart';

abstract class AuthRemoteDataSource {
  Future<SignInResponse> signIn({required String email, required String password});
}

