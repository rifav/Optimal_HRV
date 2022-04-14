// ignore_for_file: unused_field, unused_local_variable, avoid_print, prefer_final_locals, omit_local_variable_types, lines_longer_than_80_chars

import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:firebase_storage/firebase_storage.dart';

class StorageRepo {
  final FirebaseStorage _storage = FirebaseStorage
      .instance; //(bucket: 'gs://optimal-hrv-ff3f7.appspot.com');

  final _auth = firebase_auth.FirebaseAuth.instance;

  Future<String> uploadFile(File file) async {
    final user = _auth.currentUser;
    final userId = user!.uid;

    try {
      await _storage.ref('user/profile/$userId').putFile(file);
    } on FirebaseException catch (e) {
      print(e);
    }
    return userId;
  }

  Future<String> getUrlForFile(String fileKey) async {
    try {
      String result =
          await _storage.ref('user/profile/$fileKey').getDownloadURL();
      return result;
    } catch (e) {
      rethrow;
    }
  }
}
