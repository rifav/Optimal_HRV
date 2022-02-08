// ignore_for_file: lines_longer_than_80_chars, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:optimal_hrv_bloc/app/app.dart';
import 'package:optimal_hrv_bloc/home/home.dart';
import 'package:optimal_hrv_bloc/home/view/menu.dart';
import 'package:optimal_hrv_bloc/theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static Page page() => const MaterialPage<void>(child: HomePage());

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final user = context.select((AppBloc bloc) => bloc.state.user);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome'),
        backgroundColor: theme.primaryColor,
        actions: <Widget>[
          IconButton(
            key: const Key('homePage_logout_iconButton'),
            icon: const Icon(Icons.exit_to_app),
            onPressed: () => context.read<AppBloc>().add(AppLogoutRequested()),
          )
        ],
      ),
      body: Align(
        alignment: const Alignment(0, -1 / 3),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Avatar(photo: user.photo),
            const SizedBox(height: 4),
            Text(user.email ?? '', style: textTheme.headline6),
            const SizedBox(height: 4),
            Text(user.name ?? '', style: textTheme.headline5),
            ElevatedButton(
              onPressed: () {
                Navigator.push<void>(
                    context, MaterialPageRoute(builder: (_) => Menu()));
              },
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(theme.primaryColor)),
              child: const Text('Menu'),
            ),
          ],
        ),
      ),
    );
  }
}
