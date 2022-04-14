import 'package:authentication_repository/authentication_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;

class DataRepo {
  final FirebaseFirestore userCollection = FirebaseFirestore.instance;
  final currentuser = firebase_auth.FirebaseAuth.instance.currentUser;

  Future<User> updateUser(User updatedUser) async {
    // ignore: avoid_dynamic_calls
    await userCollection
        .collection('users')
        .doc(currentuser!.uid)
        .set(_convertUserToMap(updatedUser));
    return updatedUser;
  }

  Map<String, dynamic> _convertUserToMap(User user) {
    final map = <String, dynamic>{};
    map['Name'] = user.name;
    map['Gender'] = user.gender;
    map['DateOfBirth'] = user.dateOfBirth;
    map['Email'] = currentuser!.email;
    //map['Avatar'] = user.photo;

    return map;
  }
}
