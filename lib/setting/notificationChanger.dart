import 'package:flutter/material.dart';

class NotificationSettingsPage extends StatefulWidget {
  const NotificationSettingsPage({super.key});

  @override
  _NotificationSettingsPageState createState() => _NotificationSettingsPageState();
}

class _NotificationSettingsPageState extends State<NotificationSettingsPage> {
  bool _isNotificationEnabled = true;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final basePadding = screenWidth * 0.04;
    final titleFontSize = screenWidth * 0.05;
    final subtitleFontSize = screenWidth * 0.04;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Notification Settings'),
      ),
      body: Padding(
        padding: EdgeInsets.all(basePadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Manage Notifications',
              style: TextStyle(
                fontSize: titleFontSize,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: basePadding),
            SwitchListTile(
              title: Text(
                'Enable Notifications',
                style: TextStyle(fontSize: subtitleFontSize),
              ),
              value: _isNotificationEnabled,
              onChanged: (bool value) {
                setState(() {
                  _isNotificationEnabled = value;
                });
              },
              secondary: Icon(
                _isNotificationEnabled ? Icons.notifications_active : Icons.notifications_off,
                color: _isNotificationEnabled ? Colors.green : Colors.grey,
                size: screenWidth * 0.08,
              ),
              contentPadding: EdgeInsets.symmetric(horizontal: basePadding),
            ),
            if (_isNotificationEnabled) ...[
              SizedBox(height: basePadding),
              Text(
                'You will receive notifications for important updates.',
                style: TextStyle(fontSize: subtitleFontSize, color: Colors.grey),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
