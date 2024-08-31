import 'package:flutter/material.dart';

class FeedbackPage extends StatelessWidget {
  const FeedbackPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Feedback'),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          double basePadding = screenWidth * 0.04;
          double fontSize = screenWidth * 0.045;
          double headingFontSize = screenWidth * 0.06;

          return Padding(
            padding: EdgeInsets.all(basePadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'We value your feedback',
                  style: TextStyle(
                    fontSize: headingFontSize,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: basePadding),
                Text(
                  'Please provide your feedback below:',
                  style: TextStyle(fontSize: fontSize),
                ),
                SizedBox(height: basePadding * 2),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Your Name',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: basePadding * 1.5),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Your Email',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: basePadding * 1.5),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Your Feedback',
                    border: OutlineInputBorder(),
                  ),
                  maxLines: 5,
                ),
                SizedBox(height: basePadding * 2),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      // Handle feedback submission
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.2,
                        vertical: basePadding,
                      ),
                      textStyle: TextStyle(
                        fontSize: fontSize,
                      ),
                    ),
                    child: const Text('Submit'),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
