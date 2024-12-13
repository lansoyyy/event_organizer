import 'package:attendance_checker/screens/chat_screen.dart';
import 'package:attendance_checker/utils/const.dart';
import 'package:attendance_checker/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class ViewEventPage extends StatelessWidget {
  dynamic data;
  String type;

  ViewEventPage({super.key, required this.data, required this.type});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          Visibility(
            visible: type == 'Client',
            child: IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) => ChatScreen(
                            currentUserId: userId,
                            receiverId: data['uid'],
                          )),
                );
              },
              icon: const Icon(
                Icons.message,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 350,
                height: 350,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(data['img']), fit: BoxFit.cover),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextWidget(
              text: 'Name:',
              fontSize: 18,
              fontFamily: 'Bold',
              color: Colors.black,
            ),
            TextWidget(
              text: data['name'],
              fontSize: 14,
              fontFamily: 'Medium',
              color: Colors.grey,
            ),
            const SizedBox(
              height: 5,
            ),
            const Divider(),
            const SizedBox(
              height: 5,
            ),
            TextWidget(
              text: 'Description:',
              fontSize: 18,
              fontFamily: 'Bold',
              color: Colors.black,
            ),
            TextWidget(
              text: data['desc'],
              fontSize: 14,
              fontFamily: 'Medium',
              color: Colors.grey,
              maxLines: 5,
            ),
            const SizedBox(
              height: 5,
            ),
            TextWidget(
              text: 'Date:',
              fontSize: 18,
              fontFamily: 'Bold',
              color: Colors.black,
            ),
            TextWidget(
              text: data['date'],
              fontSize: 14,
              fontFamily: 'Medium',
              color: Colors.grey,
              maxLines: 5,
            ),
          ],
        ),
      ),
    );
  }
}
