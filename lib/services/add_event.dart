import 'package:attendance_checker/utils/const.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';

Future addEvent(name, date, desc, img) async {
  final docUser = FirebaseFirestore.instance.collection('Events').doc();

  final json = {
    'name': name,
    'date': date,
    'desc': desc,
    'img': img,
    'dateTime': DateTime.now(),
    'status': 'Pending',
    'uid': userId,
  };

  await docUser.set(json);
}
