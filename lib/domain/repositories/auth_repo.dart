//step-6-p1
// هذا هو الـ interface الذي يحدد ما الذي يمكن أن يفعله الـ repository

import 'package:dartz/dartz.dart';
import 'package:flutter_web/domain/entities/user_entity.dart';
import '../../core/failure.dart';
abstract class AuthRepo{
  Future<Either<Failure,UserEntity>> signIn({
    required String email,
    required String password,
});
}