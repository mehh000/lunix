import 'package:flutter/material.dart';
import 'dart:async';

class IntersialAds extends StatefulWidget {
  const IntersialAds({super.key});

  @override
  State<IntersialAds> createState() => _IntersialAdsState();
}

class _IntersialAdsState extends State<IntersialAds> {
  static const int _totalCountDownDuration = 6 * 60 * 60; // 6 hours in seconds
  List<bool> _isClicked = List.generate(16, (index) => false);
  late Timer _countdownTimer;
  int _remainingTime = 0;
  bool _isCountdownActive = false;

  @override
  void initState() {
    super.initState();
    // Initialize the countdown time to 0
    _remainingTime = _totalCountDownDuration;
  }

  void _startCountdown() {
    if (_isCountdownActive) return;

    _isCountdownActive = true;
    _countdownTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_remainingTime > 0) {
        setState(() {
          _remainingTime--;
        });
      } else {
        _resetContainers();
        _resetCountdown();
      }
    });
  }

  void _resetContainers() {
    setState(() {
      _isClicked = List.generate(16, (index) => false);
    });
  }

  void _resetCountdown() {
    setState(() {
      _remainingTime = _totalCountDownDuration;
      _isCountdownActive = false;
    });
  }

  String _formatTime(int seconds) {
    final int hours = seconds ~/ 3600;
    final int minutes = (seconds % 3600) ~/ 60;
    final int secs = seconds % 60;
    return '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${secs.toString().padLeft(2, '0')}';
  }

  @override
  void dispose() {
    _countdownTimer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
         appBar: AppBar(
        title: const Text(
          'Watch Ads',
          style: TextStyle(color: Colors.white), // AppBar text color white
        ),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
        automaticallyImplyLeading: true,
      ),
      body: Column(
        children: [
          // Countdown timer display
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Countdown: ${_formatTime(_remainingTime)}',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, // Number of containers per row
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: 16,
                itemBuilder: (context, index) {
                  return _buildContainer(index);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContainer(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isClicked[index] = !_isClicked[index];
          if (!_isCountdownActive) {
            _startCountdown();
          }
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: _isClicked[index] ? Colors.green : Colors.deepPurple,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text(
            'Play',
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
}
