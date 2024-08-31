import 'package:flutter/material.dart';

class ContactUsPage extends StatelessWidget {
  const ContactUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final basePadding = screenWidth * 0.04;
    final titleFontSize = screenWidth * 0.05;
    final subtitleFontSize = screenWidth * 0.04;
    final inputFontSize = screenWidth * 0.045;
    final buttonFontSize = screenWidth * 0.045;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact Us'),
      ),
      body: Padding(
        padding: EdgeInsets.all(basePadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Get in Touch',
              style: TextStyle(
                fontSize: titleFontSize,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: basePadding),
            Text(
              'Feel free to contact us with any questions or concerns.',
              style: TextStyle(fontSize: subtitleFontSize, color: Colors.grey),
            ),
            SizedBox(height: basePadding * 1.5),
            TextField(
              decoration: InputDecoration(
                labelText: 'Your Name',
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(
                  vertical: basePadding * 0.8,
                  horizontal: basePadding,
                ),
              ),
              style: TextStyle(fontSize: inputFontSize),
            ),
            SizedBox(height: basePadding),
            TextField(
              decoration: InputDecoration(
                labelText: 'Your Email',
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(
                  vertical: basePadding * 0.8,
                  horizontal: basePadding,
                ),
              ),
              style: TextStyle(fontSize: inputFontSize),
            ),
            SizedBox(height: basePadding),
            TextField(
              maxLines: 4,
              decoration: InputDecoration(
                labelText: 'Your Message',
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(
                  vertical: basePadding,
                  horizontal: basePadding,
                ),
              ),
              style: TextStyle(fontSize: inputFontSize),
            ),
            SizedBox(height: basePadding * 2),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Implement your contact submission logic here
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                    vertical: basePadding * 0.8,
                    horizontal: basePadding * 2,
                  ),
                ),
                child: Text(
                  'Send Message',
                  style: TextStyle(fontSize: buttonFontSize),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
