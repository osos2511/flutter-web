//step-7
import 'package:dartz/dartz.dart';
import 'package:flutter_web/core/failure.dart';
import 'package:flutter_web/domain/entities/user_entity.dart';
import 'package:flutter_web/domain/repositories/auth_repo.dart';

class SignInUseCase{
  final AuthRepo authRepo;
  SignInUseCase(this.authRepo);
  Future<Either<Failure, UserEntity>> call({required String email,required String password}){
    return authRepo.signIn(email: email, password: password);
  }

}