// ignore_for_file: avoid_print
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:formz/formz.dart';

part 'recoverpassword_state.dart';

class RecoverPasswordCubit extends Cubit<RecoverPasswordState> {
  RecoverPasswordCubit() : super(const RecoverPasswordState());

  void emailChanged(String value) {
    final email = Email.dirty(value);
    emit(state.copyWith(
      email: email,
      status: Formz.validate([email]),
    ));
  }

  Future<void> recoverPasswordFormSubmitted() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: state.email.value);
    } on FirebaseAuthException catch (e) {
      print(e.code);
    }
  }
}
