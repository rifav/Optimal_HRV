// ignore_for_file: sort_constructors_first
import 'package:image_picker/image_picker.dart';

abstract class ProfileEvent {}

class ChangeAvatarRequest extends ProfileEvent {}

class OpenImagePicker extends ProfileEvent {
  final ImageSource imageSource;
  OpenImagePicker({required this.imageSource});
}

class ProvideImagePath extends ProfileEvent {
  final String avatarPath;
  ProvideImagePath({required this.avatarPath});
}

class ProfileNameChanged extends ProfileEvent {
  final String name;
  ProfileNameChanged({required this.name});
}

class ProfileGenderChanged extends ProfileEvent {
  final String gender;
  ProfileGenderChanged({required this.gender});
}

class ProfileDobChanged extends ProfileEvent {
  final String dateOfBirth;
  ProfileDobChanged({required this.dateOfBirth});
}

class SaveProfileChanges extends ProfileEvent {}
