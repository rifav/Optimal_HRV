import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import 'package:optimal_hrv_bloc/recover_password/recover_password.dart';

class RecoverPasswordForm extends StatelessWidget {
  const RecoverPasswordForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<RecoverPasswordCubit, RecoverPasswordState>(
      listener: (context, state) {
        if (state.status.isSubmissionSuccess) {
          Navigator.of(context).pop();
        } else if (state.status.isSubmissionFailure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                  content:
                      Text(state.errorMessage ?? 'Recover Password Failure')),
            );
        }
      },
      child: Align(
        alignment: const Alignment(0, -1 / 3),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              //const SizedBox(height: 8),
              _EmailInput(),
              //const SizedBox(height: 8),
              _RecoverPasswordButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class _EmailInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecoverPasswordCubit, RecoverPasswordState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return TextField(
          key: const Key('recoverPasswordForm_emailInput_textField'),
          onChanged: (email) =>
              context.read<RecoverPasswordCubit>().emailChanged(email),
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            labelText: 'Email',
            helperText: '',
            errorText: state.email.invalid ? 'invalid email' : null,
          ),
        );
      },
    );
  }
}

class _RecoverPasswordButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecoverPasswordCubit, RecoverPasswordState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return state.status.isSubmissionInProgress
            ? const CircularProgressIndicator()
            : ElevatedButton(
                key: const Key('recoverPasswordForm_continue_raisedButton'),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  primary: const Color(0xFF0087a1),
                ),
                onPressed: state.status.isValidated
                    ? () => context
                        .read<RecoverPasswordCubit>()
                        .recoverPasswordFormSubmitted()
                        .then((value) => Navigator.of(context)
                            .popUntil((route) => route.isFirst))
                    : null,
                child: const Text('RECOVER PASSWORD'),
              );
      },
    );
  }
}
