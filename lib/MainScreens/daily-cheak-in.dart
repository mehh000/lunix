import 'dart:math';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DailyCheckIn extends StatefulWidget {
  const DailyCheckIn({super.key});

  @override
  State<DailyCheckIn> createState() => _DailyCheckInState();
}

class _DailyCheckInState extends State<DailyCheckIn> {
  List<int> bonuses = List.generate(30, (index) => 0);
  int currentDay = 0;
  DateTime? lastClaimedDate;
  Random random = Random();

  @override
  void initState() {
    super.initState();
    _loadLastClaimedDate();
    _generateBonuses();
  }

  void _generateBonuses() {
    setState(() {
      bonuses = List.generate(30, (index) => random.nextInt(100) + 1);
    });
  }

  Future<void> _loadLastClaimedDate() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? lastClaimedTime = prefs.getInt('lastClaimedDate');
    if (lastClaimedTime != null) {
      lastClaimedDate = DateTime.fromMillisecondsSinceEpoch(lastClaimedTime);
      _checkCurrentDay();
    }
  }

  Future<void> _saveLastClaimedDate(DateTime date) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('lastClaimedDate', date.millisecondsSinceEpoch);
  }

  void _checkCurrentDay() {
    if (lastClaimedDate != null) {
      DateTime now = DateTime.now();
      if (now.day != lastClaimedDate!.day ||
          now.month != lastClaimedDate!.month ||
          now.year != lastClaimedDate!.year) {
        setState(() {
          currentDay++;
        });
      }
    }
  }

  void _claimBonus() async {
    if (currentDay < 30) {
      setState(() {
        bonuses[currentDay] = -1; // Mark as claimed
        lastClaimedDate = DateTime.now();
        _saveLastClaimedDate(lastClaimedDate!);
      });
    }
  }

  Widget _buildDayBox(int dayIndex) {
    bool isClaimed = bonuses[dayIndex] == -1;
    bool isAvailable = dayIndex == currentDay;

    return GestureDetector(
      onTap: isAvailable ? _claimBonus : null,
      child: Container(
        decoration: BoxDecoration(
          color: isClaimed
              ? Color.fromARGB(255, 98, 214, 243)
              : isAvailable
                  ? Colors.green
                  : Colors.blueAccent,
          borderRadius: BorderRadius.circular(12),
          border: isAvailable
              ? Border.all(color: Colors.yellowAccent, width: 3)
              : null,
        ),
        child: Center(
          child: isClaimed
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.check, color: Colors.green, size: 20),
                    SizedBox(height: 4),
                    Text(
                      'Done',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                )
              : Text(
                  'Day ${dayIndex + 1}',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Get screen width
    double screenWidth = MediaQuery.of(context).size.width;

    // Determine crossAxisCount based on screen width
    int crossAxisCount;
    if (screenWidth > 600) {
      crossAxisCount = 5; // Larger screens, more items per row
    } else if (screenWidth > 400) {
      crossAxisCount = 4; // Medium screens, fewer items per row
    } else {
      crossAxisCount = 3; // Small screens, even fewer items per row
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Daily Check-In Bonus',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Check-In Streak: $currentDay/30 Days',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: 30,
                itemBuilder: (context, index) {
                  return _buildDayBox(index);
                },
              ),
            ),
            if (currentDay > 0 && bonuses[currentDay - 1] != -1)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Today\'s Bonus: ${bonuses[currentDay - 1]} Points',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
              ),
            ElevatedButton(
              onPressed: currentDay < 30 ? _claimBonus : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                'Claim Today\'s Bonus',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
