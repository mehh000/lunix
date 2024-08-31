import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';

class WatchAndEarnPage extends StatefulWidget {
  @override
  _WatchAndEarnPageState createState() => _WatchAndEarnPageState();
}

class _WatchAndEarnPageState extends State<WatchAndEarnPage> {
  final StreamController<int> _selectedController = StreamController<int>.broadcast();
  final List<int> _items = [1, 2, 4, 6, 8, 10, 12, 14, 16];
  final Color _backgroundColor = Color.fromARGB(255, 55, 4, 118); // Background color

  // List of colors for the slices
  final List<Color> _sliceColors = [
    Color.fromARGB(100, 152, 11, 177), // Light Pink
    Color.fromARGB(100, 255, 153, 0),  // Light Orange
    Color.fromARGB(100, 185, 184, 181), // Light Grey
    Color.fromARGB(100, 76, 175, 79),   // Light Green
    Color.fromARGB(100, 33, 149, 243),  // Light Blue
    Color.fromARGB(100, 63, 81, 181),   // Light Indigo
    Color.fromARGB(100, 155, 39, 176),  // Light Purple
    Color.fromARGB(100, 255, 105, 180), // Light Hot Pink
    Color.fromARGB(100, 0, 191, 255),   // Light Deep Sky Blue
  ];

  int _selectedValue = 0;
  bool _isSpinning = false; // Track spinning state

  @override
  void initState() {
    super.initState();
    _selectedController.stream.listen((index) {
      if (_isSpinning) {
        setState(() {
          _selectedValue = _items[index];
        });

        // Delay showing the popup after spinner stops
        Future.delayed(Duration(seconds: 5), () {
          if (!_isSpinning) {
            _showPopup();
          }
        });
      }
    });
  }

  @override
  void dispose() {
    _selectedController.close();
    super.dispose();
  }

  void _showPopup() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Congratulations!'),
          content: Container(
            padding: EdgeInsets.all(20.0),
            child: Text(
              'You won $_selectedValue!',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _startSpinning() {
    setState(() {
      _isSpinning = true;
    });
    _selectedController.add(Random().nextInt(_items.length));

    // Stop spinning after 2 seconds
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        _isSpinning = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backgroundColor,
      body: Stack(
        children: [
          // Center the FortuneWheel
          Center(
            child: FortuneWheel(
              selected: _selectedController.stream,
              items: [
                for (int i = 0; i < _items.length; i++)
                  FortuneItem(
                    child: Text(
                      _items[i].toString(),
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    style: FortuneItemStyle(
                      color: _sliceColors[i],
                      borderColor: Colors.white,
                      borderWidth: 2,
                    ),
                  ),
              ],
            ),
          ),

          // Position "Watch and Earn" text at the top
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: Text(
                "Watch and Earn",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          // Position "NEXT" button at the bottom
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 50.0),
              child: ElevatedButton(
                onPressed: _startSpinning,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 25, 214, 122),
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  'NEXT',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
