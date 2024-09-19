import 'package:attendance_checker/screens/auth/signup_page.dart';
import 'package:attendance_checker/widgets/button_widget.dart';
import 'package:attendance_checker/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/images/background.png',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 30,
                ),
                Center(
                  child: Image.asset(
                    'assets/images/logo.png',
                    width: 250,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 50),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          TextWidget(
                            text: 'E',
                            fontSize: 48,
                            fontFamily: 'Bold',
                            color: Colors.white,
                          ),
                          TextWidget(
                            text: 'vent Organizer',
                            fontSize: 36,
                            fontFamily: 'Regular',
                            color: Colors.white,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          TextWidget(
                            text: 'M',
                            fontSize: 48,
                            fontFamily: 'Bold',
                            color: Colors.white,
                          ),
                          TextWidget(
                            text: 'obile',
                            fontSize: 36,
                            fontFamily: 'Regular',
                            color: Colors.white,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          TextWidget(
                            text: 'A',
                            fontSize: 48,
                            fontFamily: 'Bold',
                            color: Colors.white,
                          ),
                          TextWidget(
                            text: 'pplication',
                            fontSize: 36,
                            fontFamily: 'Regular',
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: ButtonWidget(
                    radius: 100,
                    color: Colors.grey,
                    label: 'Get Started',
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                            builder: (context) => const SignupPage()),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
