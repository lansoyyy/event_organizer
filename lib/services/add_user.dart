import 'package:attendance_checker/utils/const.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';

Future addUser(name, email) async {
  final docUser = FirebaseFirestore.instance.collection('Users').doc(userId);

  final json = {
    'name': name,
    'email': email,
    'id': docUser.id,
    'isVerified': false,
    'events': [],
    'profile': '',
  };

  await docUser.set(json);
}
