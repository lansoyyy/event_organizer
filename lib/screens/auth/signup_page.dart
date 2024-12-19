import 'package:attendance_checker/screens/admin/admin_home.dart';
import 'package:attendance_checker/screens/auth/login_page.dart';
import 'package:attendance_checker/services/add_user.dart';
import 'package:attendance_checker/widgets/button_widget.dart';
import 'package:attendance_checker/widgets/text_widget.dart';
import 'package:attendance_checker/widgets/textfield_widget.dart';
import 'package:attendance_checker/widgets/toast_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final username = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final cpassword = TextEditingController();
  final accname = TextEditingController();
  final accnumber = TextEditingController();

  bool isClient = false;
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
                  label: 'User name',
                  controller: username,
                ),
                TextFieldWidget(
                  hintColor: Colors.white,
                  label: 'Email',
                  controller: email,
                ),
                TextFieldWidget(
                  hintColor: Colors.white,
                  label: 'Account Name for Payment Method',
                  controller: accname,
                ),
                TextFieldWidget(
                  hintColor: Colors.white,
                  label: 'Account Number for Payment Method',
                  controller: accnumber,
                  inputType: TextInputType.number,
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
                SwitchListTile(
                  title: TextWidget(
                    text: isClient ? "Client" : "Organizer",
                    fontSize: 18,
                    color: Colors.white,
                    fontFamily: 'Bold',
                  ),
                  subtitle: TextWidget(
                    text: "Switch to select user type",
                    fontSize: 12,
                    color: Colors.black,
                  ),
                  value: isClient,
                  onChanged: (bool value) {
                    setState(() {
                      isClient = value;
                    });
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                Center(
                  child: ButtonWidget(
                    color: Colors.green[800]!,
                    label: 'Signup',
                    onPressed: () {
                      if (password.text != cpassword.text) {
                        showToast('Password do not match');
                      } else {
                        register(context);
                      }
                    },
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
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
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: TextButton(
                    onPressed: () {
                      adminDialog();
                    },
                    child: TextWidget(
                      text: 'Continue as Admin',
                      fontSize: 16,
                      color: Colors.black,
                      fontFamily: 'Bold',
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

  final adminusername = TextEditingController();
  final adminpassword = TextEditingController();

  adminDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFieldWidget(
                  label: 'Admin Username',
                  controller: adminusername,
                ),
                TextFieldWidget(
                  label: 'Admin password',
                  controller: adminpassword,
                ),
                const SizedBox(
                  height: 20,
                ),
                ButtonWidget(
                  label: 'Continue',
                  onPressed: () {
                    if (adminusername.text == 'admin_username' &&
                        adminpassword.text == 'admin_password') {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                            builder: (context) => const AdminHome()),
                      );
                    } else {
                      Navigator.pop(context);
                      showToast('Invalid admin credentials!');
                    }
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  register(context) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email.text, password: password.text);

      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email.text, password: password.text);

      await FirebaseAuth.instance.currentUser!.sendEmailVerification();

      addUser(username.text, email.text, accname.text, accnumber.text,
          isClient ? 'Client' : 'Organizer');

      // signup(nameController.text, numberController.text, addressController.text,
      //     emailController.text);

      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const LoginPage()),
      );
      showToast(
          "Registered Successfully! An email verification has been sent to your email");

      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        showToast('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        showToast('The account already exists for that email.');
      } else if (e.code == 'invalid-email') {
        showToast('The email address is not valid.');
      } else {
        showToast(e.toString());
      }
    } on Exception catch (e) {
      showToast("An error occurred: $e");
    }
  }
}
