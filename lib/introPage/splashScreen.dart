import 'package:flutter/material.dart';
import 'package:lunix/introPage/introPage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Navigate to IntroPage after 3 seconds
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => IntroPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color.fromARGB(255, 5, 22, 91),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.red, Colors.pink, Colors.purple],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/logo.png', // Ensure the path is correct
                    width: 100,
                    height: 100,
                  
                  ),
                  const SizedBox(width: 20), // Adds space between the logo and text
                  Text(
                    'Lunix',
                    style: TextStyle(
                      color: Color.fromARGB(255, 3, 48, 78),
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                      fontFamily: 'Pacifico', // Increased font size for better emphasis
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30), // Adds space between the Row and the welcome message
              Text(
                'Welcome to Lunix',
                style: TextStyle(
                  color: Color.fromARGB(255, 241, 244, 246), // Slightly faded black for a softer look
                  fontSize: 24, // A good size for the welcome message
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
