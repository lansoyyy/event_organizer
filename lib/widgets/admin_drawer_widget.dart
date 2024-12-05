import 'package:attendance_checker/screens/admin/admin_events_screen.dart';
import 'package:attendance_checker/screens/admin/admin_home.dart';
import 'package:attendance_checker/screens/admin/admin_users_screen.dart';
import 'package:attendance_checker/screens/auth/login_page.dart';
import 'package:attendance_checker/screens/pages/about_us_page.dart';
import 'package:attendance_checker/screens/pages/contact_us_page.dart';
import 'package:attendance_checker/screens/pages/how_it_works_page.dart';
import 'package:attendance_checker/widgets/logout_widget.dart';
import 'package:flutter/material.dart';
import 'package:attendance_checker/widgets/text_widget.dart';

import '../utils/colors.dart';

class AdminDrawerWidget extends StatelessWidget {
  const AdminDrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: 250,
      color: Colors.blue[100],
      child: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: primary!), color: Colors.white),
                  child: Padding(
                    padding: const EdgeInsets.all(2.5),
                    child: Image.asset(
                      'assets/images/logo.png',
                      height: 75,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            ListTile(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const AdminHome()));
              },
              title: TextWidget(
                text: 'Home',
                fontSize: 14,
                fontFamily: 'Bold',
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const AdminEventsScreen()));
              },
              title: TextWidget(
                text: 'Events',
                fontSize: 14,
                fontFamily: 'Bold',
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const AdminusersScreen()));
              },
              title: TextWidget(
                text: 'Users',
                fontSize: 14,
                fontFamily: 'Bold',
              ),
            ),
          ],
        ),
      )),
    );
  }
}
