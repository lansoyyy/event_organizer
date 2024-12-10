import 'package:attendance_checker/utils/const.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future addUser(name, email, accname, accnumber) async {
  final docUser = FirebaseFirestore.instance.collection('Users').doc(userId);

  final json = {
    'name': name,
    'email': email,
    'id': docUser.id,
    'isVerified': false,
    'events': [],
    'profile': '',
    'accname': accname,
    'accnumber': accnumber,
  };

  await docUser.set(json);
}
