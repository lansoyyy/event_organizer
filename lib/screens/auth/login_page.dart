import 'package:attendance_checker/screens/auth/signup_page.dart';
import 'package:attendance_checker/screens/home_screen.dart';
import 'package:attendance_checker/widgets/button_widget.dart';
import 'package:attendance_checker/widgets/text_widget.dart';
import 'package:attendance_checker/widgets/textfield_widget.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final username = TextEditingController();
  final password = TextEditingController();

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
                  height: 30,
                ),
                Center(
                  child: Image.asset(
                    'assets/images/logo.png',
                    width: 250,
                  ),
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
                const SizedBox(
                  height: 30,
                ),
                Center(
                  child: ButtonWidget(
                    color: Colors.green[800]!,
                    label: 'Login',
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                            builder: (context) => const HomeScreen()),
                      );
                    },
                  ),
                ),
                Center(
                  child: TextButton(
                      onPressed: () {},
                      child: TextWidget(
                        decoration: TextDecoration.underline,
                        text: 'Forgot Password?',
                        fontSize: 16,
                        color: Colors.black,
                        fontFamily: 'Medium',
                      )),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      width: 75,
                      child: Divider(
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    TextWidget(
                      text: 'or',
                      fontSize: 18,
                      color: Colors.black,
                      fontFamily: 'Bold',
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const SizedBox(
                      width: 75,
                      child: Divider(
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => const SignupPage()),
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
                          text: 'Signup',
                          fontSize: 16,
                          color: Colors.black,
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
