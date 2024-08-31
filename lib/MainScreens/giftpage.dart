import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

class GiftPage extends StatefulWidget {
  const GiftPage({super.key});

  @override
  State<GiftPage> createState() => _GiftPageState();
}

class _GiftPageState extends State<GiftPage> {
  // List to store random values for each image
  final List<int> _randomValues = List.generate(16, (index) => Random().nextInt(10) + 1);

  // List to track clicked images
  final List<bool> _clickedImages = List.generate(16, (index) => false);

  DateTime? _startTime;
  late Timer _timer;
  Duration _remainingTime = Duration.zero;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_startTime != null) {
        final now = DateTime.now();
        final elapsed = now.difference(_startTime!);
        final target = Duration(hours: 6);
        setState(() {
          _remainingTime = target - elapsed;
          if (_remainingTime <= Duration.zero) {
            _resetState();
          }
        });
      }
    });
  }

  void _resetState() {
    setState(() {
      _clickedImages.fillRange(0, _clickedImages.length, false);
      _startTime = null;
    });
  }

  String _formatDuration(Duration duration) {
    final hours = duration.inHours;
    final minutes = (duration.inMinutes % 60);
    final seconds = (duration.inSeconds % 60);
    return '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    // Determine the number of columns based on the screen width
    final int crossAxisCount = MediaQuery.of(context).size.width >= 400
        ? 2
        : 1;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Gift Grid',
          style: TextStyle(color: Colors.white), // AppBar text color white
        ),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
        automaticallyImplyLeading: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              _startTime != null ? 'Time Remaining: ${_formatDuration(_remainingTime)}' : 'Click an image to start the timer',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0), // Even padding all around
              child: Center( // Center the grid
                child: GridView.builder(
                  itemCount: 16, // Number of images to display
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount, // 2 images per row
                    crossAxisSpacing: 16, // Space between columns
                    mainAxisSpacing: 16, // Space between rows
                    childAspectRatio: 1, // Make the grid items square
                  ),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _clickedImages[index] = true;
                          if (_startTime == null) {
                            _startTime = DateTime.now();
                          }
                        });

                        // Handle the random value if needed (e.g., logging)
                        int value = _randomValues[index];
                        // You can perform an action with this value here, such as logging or other logic
                      },
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                               
                              ],
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                'assets/giftbox.png',
                                fit: BoxFit.cover,
                                color: _clickedImages[index]
                                    ? Colors.black.withOpacity(0.2)
                                    : null,
                                colorBlendMode: _clickedImages[index]
                                    ? BlendMode.darken
                                    : null,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}
