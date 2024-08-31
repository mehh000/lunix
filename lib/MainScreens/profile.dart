import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lunix/setting/setting.dart'; // Required for clipboard

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Demo Exchange ID
    final String exchangeID = '1234567';

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: true,
        actions: [
          IconButton(
            icon: Icon(Icons.settings, color: Colors.blue,size: 40,),
            onPressed: () {
              // Handle settings button tap
            
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SettingsPage()),
                  );
              
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage('assets/user.png'),
            ),
            SizedBox(height: 20),
            Text(
              'John Doe',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'johndoe@example.com',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 20),
            _buildInfoRow(Icons.phone, '+123 456 7890'),
            _buildInfoRow(Icons.location_on, 'Country Name'),
            _buildInfoRow(Icons.star, 'Account Status: NonVIP'),
            _buildExchangeIDRow(context, exchangeID), // Pass context here
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.orange),
          SizedBox(width: 10),
          Text(
            text,
            style: TextStyle(
              fontSize: 18,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildExchangeIDRow(BuildContext context, String exchangeID) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(Icons.swap_horiz, color: Colors.orange),
          SizedBox(width: 10),
          Text(
            'Exchange ID: $exchangeID',
            style: TextStyle(
              fontSize: 18,
              color: Colors.black,
            ),
          ),
          Spacer(),
          IconButton(
            icon: Icon(Icons.copy, color: Colors.grey),
            onPressed: () {
              Clipboard.setData(ClipboardData(text: exchangeID));
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Exchange ID copied to clipboard!'),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
