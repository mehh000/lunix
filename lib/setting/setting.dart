import 'package:flutter/material.dart';
import 'package:lunix/setting/contactus.dart';
import 'package:lunix/setting/editprofile.dart';
import 'package:lunix/setting/feedback.dart';
import 'package:lunix/setting/notificationChanger.dart';
import 'package:lunix/setting/privacy.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Settings'),
      backgroundColor: Colors.white,

        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              // Settings logic or navigation can go here
            },
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildSettingsOption(
            context,
            icon: Icons.person,
            title: 'Profile',
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => EditProfilePage())),
          ),
          _buildSettingsOption(
            context,
            icon: Icons.lock,
            title: 'Privacy Policy',
           onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => PrivacyPolicy())),
          ),
          _buildSettingsOption(
            context,
            icon: Icons.feedback,
            title: 'Feedback',
           onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => FeedbackPage())),
          ),
          _buildSettingsOption(
            context,
            icon: Icons.share,
            title: 'Share App',
            // onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => ShareAppPage())),
          ),
          _buildSettingsOption(
            context,
            icon: Icons.notifications,
            title: 'Notification',
             onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => NotificationSettingsPage())),
          ),
          _buildSettingsOption(
            context,
            icon: Icons.contact_mail,
            title: 'Contact Us',
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => ContactUsPage())),
          ),
          _buildSettingsOption(
            context,
            icon: Icons.logout,
            title: 'Logout',
            // onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => LogoutPage())),
          ),
          // Additional options can be added here
        ],
      ),
    );
  }

  Widget _buildSettingsOption(BuildContext context,
      {required IconData icon, required String title, Function()? onTap}) {
    return ListTile(
      leading: Icon(icon, color: Colors.orange),
      title: Text(
        title,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
      ),
      trailing: Icon(Icons.arrow_forward_ios, color: Colors.grey),
      onTap: onTap ?? () {},
      contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      tileColor: Colors.white,
    );
  }
}
