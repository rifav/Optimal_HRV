import 'package:equatable/equatable.dart';

/// {@template user}
/// User model
///
/// [User.empty] represents an unauthenticated user.
/// {@endtemplate}
class User extends Equatable {
  /// {@macro user}
  const User({
    required this.id,
    this.email,
    this.name,
    this.photo,
    this.dateOfBirth,
    this.gender,
  });

  /// The current user's email address.
  final String? email;

  /// The current user's id.
  final String id;

  /// The current user's name (display name).
  final String? name;

  /// Url for the current user's photo.
  final String? photo;

  /// The current user's date of birth.
  final String? dateOfBirth;

  // The current user's gender.
  final String? gender;

  /// Empty user which represents an unauthenticated user.
  static const empty = User(id: '');

  /// Convenience getter to determine whether the current user is empty.
  bool get isEmpty => this == User.empty;

  /// Convenience getter to determine whether the current user is not empty.
  bool get isNotEmpty => this != User.empty;

  @override
  List<Object?> get props => [email, id, name, photo, dateOfBirth, gender];

  User copyWith({
    String? id,
    String? name,
    String? photo,
    String? dateOfBirth,
    String? gender,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      photo: photo ?? this.photo,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      gender: gender ?? this.gender,
    );
  }
}
