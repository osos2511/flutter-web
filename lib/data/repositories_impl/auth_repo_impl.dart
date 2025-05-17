//step-6-p2
import 'package:dartz/dartz.dart';
import 'package:flutter_web/core/failure.dart';
import 'package:flutter_web/domain/entities/user_entity.dart';
import 'package:flutter_web/domain/repositories/auth_repo.dart';
import '../datasources/auth_remote_data_source.dart';
import '../models/signIn/SignIn_response.dart';


class AuthRepositoryImpl implements AuthRepo {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, UserEntity>> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final SignInResponse response = await remoteDataSource.signIn(
        email: email,
        password: password,
      );

      if (response.user != null) {
        final userEntity = response.user!.toEntity();
        return Right(userEntity);
      } else {
        return const Left(ServerFailure('User not found'));
      }
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
