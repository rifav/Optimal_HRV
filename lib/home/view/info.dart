// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, avoid_dynamic_calls, omit_local_variable_types, lines_longer_than_80_chars, must_be_immutable, prefer_const_literals_to_create_immutables
// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, avoid_dynamic_calls, omit_local_variable_types, lines_longer_than_80_chars, must_be_immutable, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
//import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:optimal_hrv_bloc/app/app.dart';
//import 'package:optimal_hrv_bloc/home/widgets/widgets.dart';
import 'package:optimal_hrv_bloc/theme.dart';

// class Profile extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final textTheme = Theme.of(context).textTheme;
//     final user = context.select((AppBloc bloc) => bloc.state.user);

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Profile'),
//         backgroundColor: theme.primaryColor,
//         actions: <Widget>[
//           IconButton(
//             key: const Key('homePage_logout_iconButton'),
//             icon: const Icon(Icons.exit_to_app),
//             onPressed: () => context.read<AppBloc>().add(AppLogoutRequested()),
//           )
//         ],
//       ),
//       body: Align(
//         alignment: const Alignment(0, -1 / 3),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: <Widget>[
//             Avatar(photo: user.photo),
//             const SizedBox(height: 4),
//             Text(user.email ?? '', style: textTheme.headline6),
//             const SizedBox(height: 4),
//             Text(user.name ?? '', style: textTheme.headline5),
//           ],
//         ),
//       ),
//     );
//   }
// }

class ProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: _appBar(),
      body: SingleChildScrollView(child: _profilePage()),
    );
  }

  PreferredSizeWidget _appBar() {
    return AppBar(
      centerTitle: true,
      title: Text('Profile'),
      actions: [],
    );
  }

  Widget _profilePage() {
    return SafeArea(
      child: Center(
        child: Column(
          children: [
            SizedBox(height: 40),
            _avatar(),
            _changeAvatarButton(),
            SizedBox(height: 30),
            _userNameTitle(),
            _emailTitle(),
            _genderTitle(),
            _dobTitle(),
            _saveProfileChangesButton(),
          ],
        ),
      ),
    );
  }

  Widget _avatar() {
    return CircleAvatar(
      radius: 60,
      child: Icon(Icons.person),
    );
  }

  Widget _changeAvatarButton() {
    return TextButton(
      onPressed: () {},
      style: TextButton.styleFrom(primary: Colors.blue),
      child: Text('Change Avatar'),
    );
  }

  Widget _userNameTitle() {
    return ListTile(
      tileColor: Colors.white,
      leading: Icon(Icons.person_outline),
      title: Text('Name'),
    );
  }

  Widget _emailTitle() {
    return ListTile(
      tileColor: Colors.white,
      leading: Icon(Icons.email_outlined),
      title: Text('Email'),
    );
  }

  Widget _genderTitle() {
    return ListTile(
      tileColor: Colors.white,
      trailing: IconButton(
        icon: Icon(Icons.keyboard_arrow_down_outlined),
        onPressed: () => currentDate,
      ),
      leading: Icon(Icons.local_pizza_outlined),
      title: Text('Gender'),
    );
  }

  Widget _dobTitle() {
    return ListTile(
      tileColor: Colors.white,
      leading: Icon(Icons.calendar_today_outlined),
      trailing: IconButton(
        icon: Icon(Icons.keyboard_arrow_down_outlined),
        onPressed: () => currentDate,
      ),
      title: Text('Date of Birth'),
    );
  }

  Widget _saveProfileChangesButton() {
    return ElevatedButton(
      onPressed: () {},
      child: Text('Save Changes'),
    );
  }

  DateTime currentDate = DateTime.now();
////////////////select Date
// Future<void> _selectDate(BuildContext context) async {
//   final DateTime? pickedDate = await showDatePicker(
//       context: context,
//       initialDate: currentDate,
//       firstDate: DateTime(2015),
//       lastDate: DateTime(2050));
//   if (pickedDate != null && pickedDate != currentDate) {
//     setState(() {
//       currentDate = pickedDate;
//     });
//   }
// }
}