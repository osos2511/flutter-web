//step-1-p2
import '../../../domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({
    required super.id,
    required super.username,
    required super.firstName,
    required super.lastName,
    required super.email,
    required super.phone,
    required super.role,
    required super.isVerified,
    required super.createdAt,
    required super.passwordChangedAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['_id'],
      username: json['username'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
      phone: json['phone'],
      role: json['role'],
      isVerified: json['isVerified'],
      createdAt: json['createdAt'],
      passwordChangedAt: json['passwordChangedAt'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'username': username,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'phone': phone,
      'role': role,
      'isVerified': isVerified,
      'createdAt': createdAt,
      'passwordChangedAt': passwordChangedAt,
    };

  }
//step-3
  UserEntity toEntity() => UserEntity(
    id: id,
    username: username,
    firstName: firstName,
    lastName: lastName,
    email: email,
    phone: phone,
    role: role,
    isVerified: isVerified,
    createdAt: createdAt,
    passwordChangedAt: passwordChangedAt,
  );
}
