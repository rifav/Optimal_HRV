// ignore_for_file: always_use_package_imports, avoid_unused_constructor_parameters, override_on_non_overriding_member, lines_longer_than_80_chars, prefer_equal_for_default_values, unused_field, sort_constructors_first, unnecessary_statements, invalid_use_of_visible_for_testing_member, avoid_dynamic_calls, deprecated_member_use, avoid_void_async

//import 'package:authentication_repository/authentication_repository.dart';
import 'dart:io';

import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:optimal_hrv_bloc/repositories/data_repo.dart';
import 'package:optimal_hrv_bloc/repositories/storage_repo.dart';
import 'profile_event.dart';
import 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final StorageRepo storageRepo;
  final DataRepo dataRepo;
  final _picker = ImagePicker();

  ProfileBloc({
    required this.dataRepo,
    required this.storageRepo,
    required User user,
  }) : super(ProfileState(user: user)) {
    on<ChangeAvatarRequest>((event, emit) =>
        emit(state.copyWith(imageSourceActionSheetIsVisible: true)));
    on<OpenImagePicker>(_mapOpenImagePicker);
    on<ProvideImagePath>(
        (event, emit) => emit(state.copyWith(avatarPath: event.avatarPath)));
    on<ProfileNameChanged>(
        (event, emit) => emit(state.copyWith(name: event.name)));
    on<ProfileGenderChanged>(
        (event, emit) => emit(state.copyWith(gender: event.gender)));
    on<ProfileDobChanged>(
        (event, emit) => emit(state.copyWith(dateOfBirth: event.dateOfBirth)));
    on<SaveProfileChanges>(_saveProfileChanges);

    storageRepo
        .getUrlForFile(user.photo ?? '')
        .then((result) => add(ProvideImagePath(avatarPath: result)));
  }

  void _mapOpenImagePicker(
      OpenImagePicker event, Emitter<ProfileState> emit) async {
    emit(state.copyWith(imageSourceActionSheetIsVisible: false));

    final pickedImage = await _picker.getImage(source: event.imageSource);

    if (pickedImage == null) return;

    final imageKey = await storageRepo.uploadFile(File(pickedImage.path));

    final updatedUser = state.user.copyWith(photo: imageKey);

    final results = await Future.wait([
      dataRepo.updateUser(updatedUser),
      storageRepo.getUrlForFile(imageKey),
    ]);

    emit(state.copyWith(avatarPath: results.last.toString()));
  }

  void _saveProfileChanges(
      SaveProfileChanges event, Emitter<ProfileState> emit) async {
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    final updatedUser = state.user.copyWith(
        name: state.name, gender: state.gender, dateOfBirth: state.dateOfBirth);

    try {
      await dataRepo.updateUser(updatedUser);
      emit(state.copyWith(status: FormzStatus.submissionSuccess));
    } catch (e) {
      emit(state.copyWith(status: FormzStatus.submissionFailure));
    }
  }
}
