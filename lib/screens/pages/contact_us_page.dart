import 'package:attendance_checker/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class ContactUsPage extends StatelessWidget {
  const ContactUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact Us'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextWidget(
              text: 'Get in Touch',
              fontSize: 24,
              isBold: true,
              align: TextAlign.left,
            ),
            const SizedBox(height: 16),
            TextWidget(
              text:
                  'We’d love to hear from you! Reach out to us for any inquiries, feedback, or support. '
                  'Our team is here to help you make the most out of your event experience.',
              fontSize: 16,
              align: TextAlign.left,
              maxLines: 5,
            ),
            const SizedBox(height: 24),
            TextWidget(
              text: 'Contact Information',
              fontSize: 20,
              isBold: true,
              color: Colors.blueAccent,
              align: TextAlign.left,
            ),
            const SizedBox(height: 16),
            TextWidget(
              text: '📞 Phone',
              fontSize: 18,
              isBold: true,
              align: TextAlign.left,
            ),
            TextWidget(
              text: '+63 912 345 6789', // Replace with your actual phone number
              fontSize: 16,
              align: TextAlign.left,
            ),
            const SizedBox(height: 16),
            TextWidget(
              text: '📍 Location',
              fontSize: 18,
              isBold: true,
              align: TextAlign.left,
            ),
            TextWidget(
              text: 'Cagayan De Oro City, Philippines',
              fontSize: 16,
              align: TextAlign.left,
            ),
            const SizedBox(height: 16),
            TextWidget(
              text: '✉️ Email',
              fontSize: 18,
              isBold: true,
              align: TextAlign.left,
            ),
            TextWidget(
              text:
                  'contact@eventorganizer.com', // Replace with your actual email
              fontSize: 16,
              align: TextAlign.left,
            ),
            const SizedBox(height: 24),
            TextWidget(
              text: 'We look forward to connecting with you!',
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
