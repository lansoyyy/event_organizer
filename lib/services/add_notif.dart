import 'package:attendance_checker/utils/const.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';

Future addNotif(id) async {
  final docUser = FirebaseFirestore.instance.collection('Notifs').doc();

  final json = {
    'id': id,
    'dateTime': DateTime.now(),
    'status': 'Unread',
    'uid': userId,
  };

  await docUser.set(json);
}
