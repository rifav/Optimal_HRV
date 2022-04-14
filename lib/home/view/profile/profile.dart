// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, avoid_dynamic_calls, omit_local_variable_types, lines_longer_than_80_chars, must_be_immutable, prefer_const_literals_to_create_immutables, always_use_package_imports, unnecessary_new, prefer_final_fields, unnecessary_null_comparison, prefer_final_locals, unused_local_variable, prefer_function_declarations_over_variables, unused_element
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:optimal_hrv_bloc/app/app.dart';
//import 'package:optimal_hrv_bloc/app/app.dart';
import 'package:optimal_hrv_bloc/home/view/profile/profile_bloc.dart';
import 'package:optimal_hrv_bloc/home/view/profile/profile_event.dart';
import 'package:optimal_hrv_bloc/home/view/profile/profile_state.dart';
import 'package:optimal_hrv_bloc/repositories/data_repo.dart';
import 'package:optimal_hrv_bloc/repositories/storage_repo.dart';
import 'package:optimal_hrv_bloc/theme.dart';

class ProfileView extends StatelessWidget {
  ProfileView({Key? key}) : super(key: key);

  //static Page page() => MaterialPage<void>(child: ProfileView());

  DateTime currentDate = DateTime.now();
  String? userGender;
  TextEditingController _dobController = new TextEditingController();
  //TextEditingController _genderController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    final currentUser = context.select((AppBloc bloc) => bloc.state.user);
    return BlocProvider(
      create: (context) => ProfileBloc(
          user: currentUser,
          storageRepo: context.read<StorageRepo>(),
          dataRepo: context.read<DataRepo>()),
      child: BlocListener<ProfileBloc, ProfileState>(
        listener: (context, state) {
          if (state.imageSourceActionSheetIsVisible) {
            _showImageSourceActionSheet(context);
          }
        },
        child: Scaffold(
          backgroundColor: theme.scaffoldBackgroundColor,
          appBar: _appBar(),
          body: SingleChildScrollView(child: _profilePage()),
        ),
      ),
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
    return BlocBuilder<ProfileBloc, ProfileState>(builder: (context, state) {
      return SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 40),
              _avatar(),
              _changeAvatarButton(),
              SizedBox(height: 30),
              _userNameTitle(),
              _genderTitle(),
              _dobTitle(),
              _emailTitle(),
              _saveProfileChangesButton(),
            ],
          ),
        ),
      );
    });
  }

  Widget _avatar() {
    return BlocBuilder<ProfileBloc, ProfileState>(builder: (context, state) {
      return Center(
          child: state.avatarPath == null
              ? CircleAvatar(radius: 50, child: Icon(Icons.person))
              : CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(state.avatarPath),
                ));

      // return CircleAvatar(
      //   radius: 60,
      //   backgroundImage: FileImage(File(state.avatarPath)),
      //   child: Icon(Icons.person),
      // );
    });
  }

  Widget _changeAvatarButton() {
    return BlocBuilder<ProfileBloc, ProfileState>(builder: (context, state) {
      return TextButton(
        onPressed: () => context.read<ProfileBloc>().add(ChangeAvatarRequest()),
        style: TextButton.styleFrom(primary: Colors.blue),
        child: Text('Change Avatar'),
      );
    });
  }

  Widget _userNameTitle() {
    return BlocBuilder<ProfileBloc, ProfileState>(builder: (context, state) {
      return ListTile(
        tileColor: Colors.white,
        //trailing: IconButton(
        //icon: Icon(Icons.edit_outlined),
        //onPressed: () => ,
        //),
        leading: Icon(Icons.person_outline),
        title: TextFormField(
          decoration: InputDecoration(
              hintText: 'UserName',
              border: InputBorder.none,
              focusedBorder: InputBorder.none),
          onChanged: (value) =>
              context.read<ProfileBloc>().add(ProfileNameChanged(name: value)),
        ),
      );
    });
  }

  Widget _emailTitle() {
    return BlocBuilder<ProfileBloc, ProfileState>(builder: (context, state) {
      return ListTile(
        tileColor: Colors.white,
        leading: Icon(Icons.email_outlined),
        title: Text(state.userEmail!),
      );
    });
  }

  Widget _genderTitle() {
    return BlocBuilder<ProfileBloc, ProfileState>(builder: (context, state) {
      return Padding(
        padding: const EdgeInsets.only(left: 16.5),
        child: DropdownButtonFormField<String>(
          decoration: InputDecoration(
              icon: Icon(Icons.person_outline, color: Colors.black45),
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              hintText: 'Gender',
              contentPadding: const EdgeInsets.only(left: 13, right: 29.5)),
          value: userGender,
          icon: const Icon(Icons.keyboard_arrow_down_outlined),
          onChanged: (String? newValue) {
            userGender = newValue;
            //_genderController.text = userGender!;
            return context
                .read<ProfileBloc>()
                .add(ProfileGenderChanged(gender: userGender!));
          },
          items: <String>['Female', 'Male', 'Other', 'RatherNotSay']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          //onTap: (value) => context
          //.read<ProfileBloc>()
          //.add(ProfileGenderChanged(gender: value)),
        ),
      );
    });
  }

  Widget _dobTitle() {
    return BlocBuilder<ProfileBloc, ProfileState>(builder: (context, state) {
      return ListTile(
        tileColor: Colors.white,
        leading: Icon(Icons.calendar_today_outlined),
        trailing: IconButton(
            icon: Icon(Icons.keyboard_arrow_down_outlined),
            onPressed: () => _selectDate(context)),
        title: TextField(
          //onTap: () => _selectDate(context),
          readOnly: true,
          controller: _dobController,
          decoration: InputDecoration(
              hintText: 'DateOfBirth',
              border: InputBorder.none,
              focusedBorder: InputBorder.none),
          onChanged: (value) => context
              .read<ProfileBloc>()
              .add(ProfileDobChanged(dateOfBirth: value)),
        ),
      );
    });
  }

  Widget _saveProfileChangesButton() {
    return BlocBuilder<ProfileBloc, ProfileState>(builder: (context, state) {
      return (state.status.isSubmissionInProgress)
          ? CircularProgressIndicator()
          : ElevatedButton(
              onPressed: () =>
                  context.read<ProfileBloc>().add(SaveProfileChanges()),
              style: ElevatedButton.styleFrom(primary: const Color(0xFF0087a1)),
              child: Text('Save Changes'),
            );
    });
  }

  void _showImageSourceActionSheet(BuildContext context) {
    Function(ImageSource) selectImageSource = (imageSource) {
      context
          .read<ProfileBloc>()
          .add(OpenImagePicker(imageSource: imageSource));
    };
    if (Platform.isIOS) {
      showCupertinoModalPopup<void>(
        context: context,
        builder: (context) => CupertinoActionSheet(
          actions: [
            CupertinoActionSheetAction(
              child: Text('Camera'),
              onPressed: () {
                Navigator.pop(context);
                selectImageSource(ImageSource.camera);
              },
            ),
            CupertinoActionSheetAction(
              child: Text('Gallery'),
              onPressed: () {
                Navigator.pop(context);
                selectImageSource(ImageSource.gallery);
              },
            )
          ],
        ),
      );
    } else {
      showModalBottomSheet<void>(
        context: context,
        builder: (context) => Wrap(children: [
          ListTile(
            leading: Icon(Icons.camera_alt),
            title: Text('Camera'),
            onTap: () {
              Navigator.pop(context);
              selectImageSource(ImageSource.camera);
            },
          ),
          ListTile(
            leading: Icon(Icons.photo_album),
            title: Text('Gallery'),
            onTap: () {
              Navigator.pop(context);
              selectImageSource(ImageSource.gallery);
            },
          ),
        ]),
      );
    }
  }

////////////////select Date
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: currentDate,
        firstDate: DateTime(1940),
        lastDate: DateTime(2050));
    if (pickedDate != null && pickedDate != currentDate) {
      //setState(() {
      //currentDate = pickedDate;
      _dobController.text = DateFormat.yMd().format(pickedDate).toString();
      //});
    }
  }
}
