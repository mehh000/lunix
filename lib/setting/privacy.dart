import 'package:flutter/material.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Privacy Policy'),
       // automaticallyImplyLeading: false,
        scrolledUnderElevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          double basePadding = screenWidth * 0.04;
          double fontSize = screenWidth * 0.045;
          double headingFontSize = screenWidth * 0.06;

          return SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: basePadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: basePadding),
                Text(
                  'Privacy Policy',
                  style: TextStyle(
                    fontSize: headingFontSize,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: basePadding),
                Text(
                  'Your privacy is important to us. It is our policy to respect your privacy regarding any information we may collect from you across our website, our app, and other sites we own and operate.',
                  style: TextStyle(fontSize: fontSize),
                ),
                SizedBox(height: basePadding),
                Text(
                  'Information We Collect',
                  style: TextStyle(
                    fontSize: headingFontSize,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: basePadding * 0.5),
                Text(
                  'We only collect information that is necessary for the functioning of our app. This may include personal data like your name, email address, and phone number.',
                  style: TextStyle(fontSize: fontSize),
                ),
                SizedBox(height: basePadding),
                Text(
                  'How We Use Information',
                  style: TextStyle(
                    fontSize: headingFontSize,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: basePadding * 0.5),
                Text(
                  'The information we collect is used to improve our services and provide you with a better user experience. We do not share your personal information with third parties, except where required by law.',
                  style: TextStyle(fontSize: fontSize),
                ),
                SizedBox(height: basePadding),
                Text(
                  'Data Security',
                  style: TextStyle(
                    fontSize: headingFontSize,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: basePadding * 0.5),
                Text(
                  'We take the security of your data seriously and take appropriate measures to protect your information from unauthorized access, disclosure, or destruction.',
                  style: TextStyle(fontSize: fontSize),
                ),
                SizedBox(height: basePadding),
                Text(
                  'Your Rights',
                  style: TextStyle(
                    fontSize: headingFontSize,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: basePadding * 0.5),
                Text(
                  'You have the right to access, correct, or delete your personal data. If you have any concerns about your privacy or the handling of your data, please contact us.',
                  style: TextStyle(fontSize: fontSize),
                ),
                SizedBox(height: basePadding),
                Text(
                  'Changes to This Policy',
                  style: TextStyle(
                    fontSize: headingFontSize,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: basePadding * 0.5),
                Text(
                  'We may update our privacy policy from time to time. We encourage you to review this page periodically for any changes. Your continued use of our app after any modifications to the policy will constitute your acknowledgment of the changes and your consent to abide and be bound by the updated policy.',
                  style: TextStyle(fontSize: fontSize),
                ),
                SizedBox(height: basePadding),
                Text(
                  'Contact Us',
                  style: TextStyle(
                    fontSize: headingFontSize,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: basePadding * 0.5),
                Text(
                  'If you have any questions or concerns about our privacy policy, please contact us at [your contact information].',
                  style: TextStyle(fontSize: fontSize),
                ),
                SizedBox(height: basePadding * 2),
              ],
            ),
          );
        },
      ),
    );
  }
}
