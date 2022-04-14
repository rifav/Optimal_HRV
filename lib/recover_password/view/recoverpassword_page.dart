import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:optimal_hrv_bloc/recover_password/recover_password.dart';

class RecoverPasswordPage extends StatelessWidget {
  const RecoverPasswordPage({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const RecoverPasswordPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(150),
        child: AppBar(
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(30),
            child: Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                children: const [
                  Text(
                    'Recover Password',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: BlocProvider<RecoverPasswordCubit>(
          create: (_) => RecoverPasswordCubit(),
          child: const RecoverPasswordForm(),
        ),
      ),
    );
  }
}
