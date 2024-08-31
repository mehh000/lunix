import 'package:flutter/material.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  // Initial values for the profile information
  String _name = 'John Doe';
  String _email = 'johndoe@example.com';
  String _phone = '+123 456 7890';
  String _country = 'Country Name';

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final basePadding = screenWidth * 0.05;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
      ),
      body: Padding(
        padding: EdgeInsets.all(basePadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage('assets/user.png'),
              ),
            ),
            SizedBox(height: basePadding * 1.5),
            _buildTextField('Name', _name, (value) {
              setState(() {
                _name = value;
              });
            }),
            SizedBox(height: basePadding),
            _buildTextField('Email', _email, (value) {
              setState(() {
                _email = value;
              });
            }),
            SizedBox(height: basePadding),
            _buildTextField('Phone Number', _phone, (value) {
              setState(() {
                _phone = value;
              });
            }),
            SizedBox(height: basePadding),
            _buildTextField('Country', _country, (value) {
              setState(() {
                _country = value;
              });
            }),
            SizedBox(height: basePadding * 2),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Handle save action
                  // You can implement the logic to save the profile changes here
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                    vertical: basePadding * 0.8,
                    horizontal: basePadding * 2,
                  ),
                ),
                child: Text(
                  'Save Changes',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, String initialValue, Function(String) onChanged) {
    return TextField(
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
      ),
      controller: TextEditingController(text: initialValue),
      onChanged: onChanged,
    );
  }
}
