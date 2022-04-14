// ignore_for_file: prefer_initializing_formals, empty_constructor_bodies, avoid_unused_constructor_parameters, unnecessary_this, lines_longer_than_80_chars, must_be_immutable, type_annotate_public_apis

//import 'package:authentication_repository/authentication_repository.dart';
import 'package:authentication_repository/authentication_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

class ProfileState extends Equatable {
  ProfileState({
    required User user,
    String? name,
    String? avatarPath,
    String? gender,
    this.status = FormzStatus.pure,
    String? dateOfBirth,
    bool imageSourceActionSheetIsVisible = false,
  })  : this.user = user,
        this.name = name ?? 'name',
        this.avatarPath = avatarPath ?? 'path',
        this.gender = gender ?? 'gender',
        this.dateOfBirth = dateOfBirth ?? 'dateOfBirth',
        this.imageSourceActionSheetIsVisible = imageSourceActionSheetIsVisible;

  final User user;
  final String name;
  final String avatarPath;
  final String dateOfBirth;
  final String gender;
  final FormzStatus status;
  bool imageSourceActionSheetIsVisible;

  String? get userEmail => user.email;

  @override
  List<Object> get props => [name, avatarPath, dateOfBirth, gender, status];

  ProfileState copyWith({
    User? user,
    String? name,
    String? avatarPath,
    String? dateOfBirth,
    String? gender,
    FormzStatus? status,
    bool? imageSourceActionSheetIsVisible,
  }) {
    return ProfileState(
      user: user ?? this.user,
      name: name ?? this.name,
      avatarPath: avatarPath ?? this.avatarPath,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      gender: gender ?? this.gender,
      status: status ?? this.status,
      imageSourceActionSheetIsVisible: imageSourceActionSheetIsVisible ??
          this.imageSourceActionSheetIsVisible,
    );
  }
}
