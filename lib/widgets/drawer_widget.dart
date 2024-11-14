import 'package:attendance_checker/screens/auth/login_page.dart';
import 'package:attendance_checker/widgets/logout_widget.dart';
import 'package:flutter/material.dart';
import 'package:attendance_checker/widgets/text_widget.dart';

import '../utils/colors.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

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
                // Navigator.of(context).pushReplacement(MaterialPageRoute(
                //     builder: (context) => const HomeScreen()));
              },
              title: TextWidget(
                text: 'How it Works?',
                fontSize: 14,
                fontFamily: 'Bold',
              ),
            ),
            ListTile(
              title: TextWidget(
                text: 'About Us',
                fontSize: 14,
                fontFamily: 'Bold',
              ),
            ),
            ListTile(
              title: TextWidget(
                text: 'Contact Us',
                fontSize: 14,
                fontFamily: 'Bold',
              ),
            ),
            ListTile(
              onTap: () {
                logout(context, const LoginPage());
              },
              title: TextWidget(
                text: 'Logout',
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
