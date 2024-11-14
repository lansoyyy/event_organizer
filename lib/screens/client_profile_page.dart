import 'package:attendance_checker/screens/chat_screen.dart';
import 'package:attendance_checker/utils/const.dart';
import 'package:attendance_checker/widgets/button_widget.dart';
import 'package:attendance_checker/widgets/text_widget.dart';
import 'package:attendance_checker/widgets/textfield_widget.dart';
import 'package:flutter/material.dart';

class ClientProfileScreen extends StatefulWidget {
  dynamic data;
  ClientProfileScreen({super.key, required this.data});

  @override
  State<ClientProfileScreen> createState() => _ClientProfileScreenState();
}

class _ClientProfileScreenState extends State<ClientProfileScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      username.text = widget.data['name'];
      email.text = widget.data['email'];
    });
  }

  final username = TextEditingController();
  final email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextWidget(
          text: 'CLIENT PROFILE',
          fontSize: 18,
          fontFamily: 'Bold',
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (context) => ChatScreen(
                          currentUserId: userId,
                          receiverId: widget.data.id,
                        )),
              );
            },
            icon: const Icon(
              Icons.chat,
            ),
          ),
        ],
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
                  'assets/images/profile.png',
                  width: 150,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: TextFieldWidget(
                  label: 'Username',
                  controller: username,
                  enabled: false,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: TextFieldWidget(
                  label: 'Email',
                  controller: email,
                  enabled: false,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: TextFieldWidget(
                  label: 'Password',
                  controller: TextEditingController(text: '*******'),
                  isObscure: true,
                  showEye: true,
                  enabled: false,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
