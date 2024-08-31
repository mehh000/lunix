import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';

class VideoADS extends StatefulWidget {
  const VideoADS({super.key});

  @override
  State<VideoADS> createState() => _VideoADSState();
}

class _VideoADSState extends State<VideoADS> {
  int _watchCount = 15;
  int _balance = 1180;

  @override
  void initState() {
    super.initState();
    _loadWatchCount();
  }

  // Load the watch count from shared preferences
  _loadWatchCount() async {
    final prefs = await SharedPreferences.getInstance();
    final today = DateFormat('yyyyMMdd').format(DateTime.now());

    String? lastSavedDay = prefs.getString('lastSavedDay');

    if (lastSavedDay == null || lastSavedDay != today) {
      _watchCount = 15; // Reset to 15 if it's a new day
      prefs.setString('lastSavedDay', today);
    } else {
      setState(() {
        _watchCount = prefs.getInt('watchCount') ?? 15;
      });
    }
  }

  // Save the watch count to shared preferences
  _saveWatchCount() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _watchCount--;
      _balance += 50; // Increment balance by 50
    });
    prefs.setInt('watchCount', _watchCount);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      backgroundColor: Color(0xFF5B3FC0),

      ),
      backgroundColor: Color(0xFF5B3FC0),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 60.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Balance Display
            Container(
              padding: EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: Color(0xFF7247D2),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.attach_money_rounded,
                    color: Colors.greenAccent,
                    size: 30,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'MY BALANCE',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '$_balance',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Spacer(),
            // Watch Video Section
            Icon(
              Icons.ondemand_video,
              size: 80,
              color: Colors.white,
            ),
            SizedBox(height: 20),
            Text(
              'Watch Video',
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              '$_watchCount/15',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Spacer(),
            // Watch Button
            ElevatedButton(
              onPressed: _watchCount > 0
                  ? () {
                      _saveWatchCount();
                    }
                  : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF25D67A),
                padding: EdgeInsets.symmetric(horizontal: 150, vertical: 35),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Text(
                'WATCH',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: VideoADS(),
  ));
}
