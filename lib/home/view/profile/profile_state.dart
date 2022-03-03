// ignore_for_file: prefer_initializing_formals

import 'package:authentication_repository/authentication_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

class ProfileState extends Equatable {
  const ProfileState(
      {required User user,
      required String name,
      required String avatarPath,
      required DateTime dateOfBirth,
      required String gender,
      this.status = FormzStatus.pure})
      : user = user,
        name = name,
        avatarPath = avatarPath,
        dateOfBirth = dateOfBirth,
        gender = gender;

  final User user;
  final String name;
  final String avatarPath;
  final DateTime dateOfBirth;
  final String gender;
  final FormzStatus status;

  String? get email => user.email;
  String? get username => user.name;

  @override
  List<Object> get props =>
      [user, name, avatarPath, dateOfBirth, gender, status];

  ProfileState copyWith({
    User? user,
    String? name,
    String? avatarPath,
    DateTime? dateOfBirth,
    String? gender,
    FormzStatus? status,
  }) {
    return ProfileState(
      user: user ?? this.user,
      name: name ?? this.name,
      avatarPath: avatarPath ?? this.avatarPath,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      gender: gender ?? this.gender,
      status: status ?? this.status,
    );
  }
}
