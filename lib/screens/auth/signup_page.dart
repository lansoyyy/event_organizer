import 'package:attendance_checker/screens/auth/login_page.dart';
import 'package:attendance_checker/screens/home_screen.dart';
import 'package:attendance_checker/widgets/button_widget.dart';
import 'package:attendance_checker/widgets/text_widget.dart';
import 'package:attendance_checker/widgets/textfield_widget.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final username = TextEditingController();
  final password = TextEditingController();
  final cpassword = TextEditingController();
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
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 75,
                ),
                TextWidget(
                  text: 'Signup',
                  fontSize: 24,
                  fontFamily: 'Bold',
                  color: Colors.white,
                ),
                const SizedBox(
                  height: 30,
                ),
                TextFieldWidget(
                  hintColor: Colors.white,
                  label: 'Username',
                  controller: username,
                ),
                TextFieldWidget(
                  hintColor: Colors.white,
                  label: 'Password',
                  controller: password,
                  isObscure: true,
                  showEye: true,
                ),
                TextFieldWidget(
                  hintColor: Colors.white,
                  label: 'Confirm Password',
                  controller: cpassword,
                  isObscure: true,
                  showEye: true,
                ),
                const SizedBox(
                  height: 30,
                ),
                Center(
                  child: ButtonWidget(
                    color: Colors.green[800]!,
                    label: 'Signup',
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                            builder: (context) => const HomeScreen()),
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                            builder: (context) => const LoginPage()),
                      );
                    },
                    child: Container(
                      height: 50,
                      width: 275,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: TextWidget(
                          text: 'Have an account? Log In',
                          fontSize: 16,
                          color: Colors.green[800],
                          fontFamily: 'Bold',
                        ),
                      ),
                    ),
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
