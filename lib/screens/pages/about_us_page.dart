import 'package:attendance_checker/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Us'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextWidget(
              text: 'About Event Organizer',
              fontSize: 24,
              isBold: true,
              align: TextAlign.left,
            ),
            const SizedBox(height: 16),
            TextWidget(
              text:
                  'Event Organizer is your go-to app for discovering, connecting, and booking events seamlessly. '
                  'We’re committed to making it easier for people to find events they love and stay connected with organizers, '
                  'all in one place.',
              fontSize: 16,
              align: TextAlign.left,
              maxLines: 5,
            ),
            const SizedBox(height: 16),
            TextWidget(
              text: 'Our Mission',
              fontSize: 20,
              isBold: true,
              color: Colors.blueAccent,
              align: TextAlign.left,
            ),
            const SizedBox(height: 8),
            TextWidget(
              text:
                  'To create a bridge between event enthusiasts and organizers, making event management '
                  'and discovery an effortless experience for all.',
              fontSize: 16,
              align: TextAlign.left,
              maxLines: 3,
            ),
            const SizedBox(height: 16),
            TextWidget(
              text: 'Our Team',
              fontSize: 20,
              isBold: true,
              color: Colors.blueAccent,
              align: TextAlign.left,
            ),
            const SizedBox(height: 8),
            TextWidget(
              text:
                  'We are a team of passionate developers, designers, and event enthusiasts who understand '
                  'the importance of a well-organized event. We are here to make it easier for you to find and connect with '
                  'event organizers, ensuring an enjoyable experience from discovery to booking.',
              fontSize: 16,
              align: TextAlign.left,
              maxLines: 4,
            ),
            const SizedBox(height: 16),
            TextWidget(
              text: 'Contact Us',
              fontSize: 20,
              isBold: true,
              color: Colors.blueAccent,
              align: TextAlign.left,
            ),
            const SizedBox(height: 8),
            TextWidget(
              text:
                  'Got questions? Feel free to reach out at contact@eventorganizer.com. We’d love to hear from you!',
              fontSize: 16,
              align: TextAlign.left,
              maxLines: 3,
              color: Colors.black87,
            ),
          ],
        ),
      ),
    );
  }
}
