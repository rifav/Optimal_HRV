// ignore_for_file: always_use_package_imports, avoid_unused_constructor_parameters, override_on_non_overriding_member, lines_longer_than_80_chars

import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'profile_event.dart';
import 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc({
    required User user,
    required String name,
    required String avatarPath,
    required DateTime dateOfBirth,
    required String gender,
  }) : super(ProfileState(
          user: user,
          name: name,
          avatarPath: avatarPath,
          dateOfBirth: dateOfBirth,
          gender: gender,
        ));

  @override
  Stream<ProfileState> mapEventToState(ProfileEvent event) async* {
    if (event is ChangeAvatarRequest) {
      //show action sheet

    } else if (event is OpenImagePicker) {
      //open image picker
    } else if (event is ProvideImagePath) {
      yield state.copyWith(avatarPath: event.avatarPath);
    } else if (event is ProfileNameChanged) {
      yield state.copyWith(name: event.name);
    } else if (event is ProfileGenderChanged) {
      yield state.copyWith(gender: event.gender);
    } else if (event is ProfileDobChanged) {
      yield state.copyWith(dateOfBirth: event.dateOfBirth);
    } else if (event is SaveProfileChanges) {
      //handle save changes
    }
  }
}
