import 'package:flutter/material.dart';
import 'package:lunix/introPage/welcomePage.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  int currentIndex = 0;

  // Function to display the image and text
  Widget buildIntroContent(String imagePath, String title, String description) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          imagePath,
          width: 250,
          height: 250,
        ),
        const SizedBox(height: 20),
        Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(
            description,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              color: Colors.black54,
            ),
          ),
        ),
      ],
    );
  }

  // List of content for the intro pages
  final List<Map<String, String>> introPages = [
    {
      'imagePath': 'assets/spinner.png',
      'title': 'Spin to Win',
      'description': 'Try your luck with the Lucky Wheel Spinner.\n'
          'Every spin gives you a chance to earn LXC rewards!',
    },
    {
      'imagePath': 'assets/playing.png',
      'title': 'Play & Earn',
      'description': 'Dive into fun games and start collecting LXC.\n'
          'The more you play, the more you earn!',
    },
    {
      'imagePath': 'assets/winning.png',
      'title': 'Lottery Wins',
      'description': 'Enter the lottery for a shot at big prizes.\n'
          'Win real money and watch your earnings grow!',
    },
  ];

  // Function to move to the next page
  void nextPage() {
    setState(() {
      if (currentIndex < introPages.length - 1) {
        currentIndex++;
      } else {
        // Handle the end of the intro (e.g., navigate to the main app screen)
      }
    });
  }

  // Function to move to the previous page
  void previousPage() {
    setState(() {
      if (currentIndex > 0) {
        currentIndex--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentPage = introPages[currentIndex];

    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Skip Button
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(
                  onPressed: () {
                    // Handle skip action

                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => WelcomePage()),
                    );
                  },
                  child: Text(
                    'Skip',
                    style: TextStyle(
                      color: Colors.blueAccent,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),

            // Display the current intro content
            Expanded(
              child: buildIntroContent(
                currentPage['imagePath']!,
                currentPage['title']!,
                currentPage['description']!,
              ),
            ),

            // Navigation Buttons or "Let's Start" button on the last page
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  if (currentIndex > 0)
                    TextButton(
                      onPressed: previousPage,
                      child: Text(
                        'Previous',
                        style: TextStyle(
                          color: Colors.blueAccent,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  if (currentIndex < introPages.length - 1)
                    TextButton(
                      onPressed: nextPage,
                      child: Text(
                        'Next',
                        style: TextStyle(
                          color: Colors.blueAccent,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  if (currentIndex == introPages.length - 1)
                    ElevatedButton(
                      onPressed: () {
                        // Navigate to the main app screen

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => WelcomePage()),
                        );
                      },
                      child: Text(
                        "Let's Start",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                          horizontal: 30.0,
                          vertical: 10.0,
                        ),
                        backgroundColor: Colors.blueAccent,
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
