import 'package:flutter/material.dart';

import '../../widgets/text_widget.dart';

class HowItWorksPage extends StatelessWidget {
  const HowItWorksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('How It Works'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextWidget(
              text: 'Welcome to Event Organizer!',
              fontSize: 24,
              isBold: true,
              align: TextAlign.left,
            ),
            const SizedBox(height: 16),
            TextWidget(
              text:
                  'Our app allows you to discover and book exciting events easily. '
                  'Here’s how you can make the most out of it:',
              fontSize: 16,
              align: TextAlign.left,
              maxLines: 4,
            ),
            const SizedBox(height: 16),
            TextWidget(
              text: '1. Browse Events',
              fontSize: 20,
              isBold: true,
              color: Colors.blueAccent,
              align: TextAlign.left,
            ),
            const SizedBox(height: 8),
            TextWidget(
              text:
                  'Explore a variety of events happening near you or around the world. '
                  'Get event details, dates, and locations all in one place.',
              fontSize: 16,
              align: TextAlign.left,
              maxLines: 3,
            ),
            const SizedBox(height: 16),
            TextWidget(
              text: '2. Connect with Organizers',
              fontSize: 20,
              isBold: true,
              color: Colors.blueAccent,
              align: TextAlign.left,
            ),
            const SizedBox(height: 8),
            TextWidget(
              text:
                  'Have questions about the event? Use our in-app messaging to chat '
                  'directly with event organizers for more details.',
              fontSize: 16,
              align: TextAlign.left,
              maxLines: 3,
            ),
            const SizedBox(height: 16),
            TextWidget(
              text: '3. Book Your Spot',
              fontSize: 20,
              isBold: true,
              color: Colors.blueAccent,
              align: TextAlign.left,
            ),
            const SizedBox(height: 8),
            TextWidget(
              text:
                  'Secure your place at the event by booking directly through the app. '
                  'We make it easy for you to plan your attendance hassle-free.',
              fontSize: 16,
              align: TextAlign.left,
              maxLines: 3,
            ),
            const SizedBox(height: 16),
            TextWidget(
              text: 'Enjoy your experience with Event Organizer!',
              fontSize: 18,
              isBold: true,
              isItalize: true,
              align: TextAlign.center,
              color: Colors.green,
            ),
          ],
        ),
      ),
    );
  }
}
