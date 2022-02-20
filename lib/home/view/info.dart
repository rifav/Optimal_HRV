// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:optimal_hrv_bloc/app/app.dart';
import 'package:optimal_hrv_bloc/home/widgets/widgets.dart';
import 'package:optimal_hrv_bloc/theme.dart';

class Page3 extends StatelessWidget {
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
          ],
        ),
      ),
    );
  }
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       centerTitle: true,
  //       title: const Text('User info'),
  //       backgroundColor: theme.primaryColor,
  //       automaticallyImplyLeading: false,
  //     ),
  //     body: Column(
  //       children: [
  //         Container(
  //           alignment: Alignment.center,
  //           margin: const EdgeInsets.only(top: 150),
  //           child: const Text(
  //               'More information about the user will be added here.'),
  //         ),
  //       ],
  //     ),
  //   );
  // }
}
