import 'package:attendance_checker/utils/colors.dart';
import 'package:attendance_checker/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<String> messages = [];
  final TextEditingController messageController = TextEditingController();

  void sendMessage() {
    if (messageController.text.isNotEmpty) {
      setState(() {
        messages.add(messageController.text);
      });
      messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextWidget(
          text: 'MESSAGES',
          fontSize: 18,
          fontFamily: 'Bold',
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 500,
            child: ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: messages.length,
              itemBuilder: (context, index) {
                bool isMe = index % 2 == 0;
                return Row(
                  mainAxisAlignment:
                      isMe ? MainAxisAlignment.start : MainAxisAlignment.end,
                  children: [
                    if (isMe)
                      const Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: CircleAvatar(
                          radius: 20,
                          backgroundImage: AssetImage('assets/avatar.png'),
                        ),
                      ),
                    if (!isMe) const SizedBox(width: 40), // Space for alignment
                    Expanded(
                      child: Align(
                        alignment:
                            isMe ? Alignment.centerLeft : Alignment.centerRight,
                        child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 5.0),
                          padding: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 15.0),
                          decoration: BoxDecoration(
                            color: isMe
                                ? Colors.blue[100]
                                : Colors.greenAccent[100],
                            borderRadius: BorderRadius.only(
                              topLeft: const Radius.circular(20),
                              topRight: const Radius.circular(20),
                              bottomLeft: isMe
                                  ? const Radius.circular(0)
                                  : const Radius.circular(20),
                              bottomRight: isMe
                                  ? const Radius.circular(20)
                                  : const Radius.circular(0),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                blurRadius: 5.0,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: TextWidget(
                            text: messages[index],
                            fontSize: 16.0,
                            isItalize: false,
                            isBold: false,
                            align: TextAlign.left,
                            color: Colors.black87,
                            fontFamily: 'Regular',
                          ),
                        ),
                      ),
                    ),
                    if (!isMe)
                      const Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: CircleAvatar(
                          radius: 20,
                          backgroundImage: AssetImage('assets/avatar.png'),
                        ),
                      ),
                    if (isMe) const SizedBox(width: 40), // Space for alignment
                  ],
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: messageController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey[200],
                      hintText: 'Type here . . ',
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 15.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                FloatingActionButton(
                  onPressed: sendMessage,
                  backgroundColor: primary,
                  child: const Icon(
                    Icons.send,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
