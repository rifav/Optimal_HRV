part of 'recoverpassword_cubit.dart';

class RecoverPasswordState extends Equatable {
  const RecoverPasswordState({
    this.email = const Email.pure(),
    this.errorMessage,
    this.status = FormzStatus.pure,
  });

  final Email email;
  final FormzStatus status;
  final String? errorMessage;

  @override
  List<Object> get props => [email, status];

  RecoverPasswordState copyWith({
    Email? email,
    String? errorMessage,
    FormzStatus? status,
  }) {
    return RecoverPasswordState(
      email: email ?? this.email,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
