import 'package:attendance_checker/widgets/button_widget.dart';
import 'package:attendance_checker/widgets/text_widget.dart';
import 'package:attendance_checker/widgets/textfield_widget.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final username = TextEditingController();
  final email = TextEditingController();
  final number = TextEditingController();
  final password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextWidget(
          text: 'PROFILE',
          fontSize: 18,
          fontFamily: 'Bold',
        ),
        centerTitle: true,
      ),
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Image.asset(
                  'assets/images/12111 1.png',
                  width: 150,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: TextFieldWidget(label: 'Username', controller: username),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: TextFieldWidget(label: 'Email', controller: email),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: TextFieldWidget(
                  label: 'Phone Number',
                  controller: number,
                  inputType: TextInputType.number,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: TextFieldWidget(
                  label: 'Password',
                  controller: password,
                  isObscure: true,
                  showEye: true,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: ButtonWidget(
                  label: 'Update',
                  onPressed: () {},
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: ButtonWidget(
                  label: 'Event Organizer',
                  onPressed: () {},
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
