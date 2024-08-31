import 'package:flutter/material.dart';
import 'package:lunix/MainScreens/ads.dart';
import 'package:lunix/MainScreens/daily-cheak-in.dart';
import 'package:lunix/MainScreens/giftpage.dart';
import 'package:lunix/MainScreens/spinerweel.dart';
import 'package:lunix/MainScreens/ticketpage.dart';
import 'package:lunix/MainScreens/videoads.dart';
import 'package:lunix/components/ticket-buy-page.dart';

class BodyOfHomepage extends StatelessWidget {
  const BodyOfHomepage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: GridView.builder(
              shrinkWrap: true,
              physics:
                  NeverScrollableScrollPhysics(), // Disable scroll for GridView
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Number of cards per row
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio:
                    1.8, // Adjust this to change height-to-width ratio
              ),
              itemCount: 4,
              itemBuilder: (context, index) {
                return _buildCard(
                  context: context,
                  color: _getColorByIndex(index),
                  title: _getTitleByIndex(index),
                  imageurl: _getImageUrlByIndex(index),
                  page: _getPageByIndex(index),
                );
              },
            ),
          ),
          // First stack with video content
          Stack(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => VideoADS()),
                  );
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 14),
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  width: double.infinity,
                  child: Row(
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white.withOpacity(0.2),
                        ),
                        child: Image.asset('assets/video.png'),
                      ),
                      SizedBox(width: 20),
                      Text(
                        'Watch video',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Opacity(
                    opacity: 0.7,
                    child: Image.asset(
                      'assets/laptop-money.png',
                      height: 80,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          // Tickets container
          Stack(
            children: [
              GestureDetector(
                  onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LotteryTicket()),
                  );
                },
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(25),
                  margin: EdgeInsets.symmetric(horizontal: 13),
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Tickets',
                            style: TextStyle(
                              fontSize: 28,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            '22:00:00',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 0,
                right: 20,
                bottom: 0,
                child: Opacity(
                  opacity: 1,
                  child: Image.asset(
                    'assets/ticketfree.png',
                    height: 150,
                    width: 150,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          // Daily Check-out container
          Stack(
            children: [
              
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DailyCheckIn()),
                  );
                },
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(25),
                  margin: EdgeInsets.symmetric(horizontal: 13),
                  decoration: BoxDecoration(
                    color: Colors.deepPurple,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Stack(
                    children:[ 
                      Positioned(
                top: 0,
                right: 0,
                bottom: 0,
                child: Opacity(
                  opacity: 1,
                  child: Image.asset(
                    'assets/bonus.png',
                    height: 150,
                    width: 150,
                  ),
                ),
              ),
                      
                      Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Daily Check-out',
                              style: TextStyle(
                                fontSize: 28,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              '22:00:00',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ), ] 
                  ),
                ),
              ),
              
            ],
          ),
        ],
      ),
    );
  }

  // Methods to get color, title, image URL, and page by index
  Color _getColorByIndex(int index) {
    switch (index) {
      case 0:
        return Color.fromARGB(255, 214, 42, 208);
      case 1:
        return Colors.blue;
      case 2:
        return Colors.green;
      case 3:
        return Colors.purple;
      default:
        return Colors.grey;
    }
  }

  String _getTitleByIndex(int index) {
    switch (index) {
      case 0:
        return 'Gift';
      case 1:
        return 'Spin';
      case 2:
        return 'Ads';
      case 3:
        return 'Play';
      default:
        return '';
    }
  }

  String _getImageUrlByIndex(int index) {
    switch (index) {
      case 0:
        return 'assets/gift.png';
      case 1:
        return 'assets/wheel.png';
      case 2:
        return 'assets/video.png';
      case 3:
        return 'assets/dice.png';
      default:
        return '';
    }
  }

  Widget _getPageByIndex(int index) {
    switch (index) {
      case 0:
        return GiftPage(); // Replace with appropriate page
      case 1:
        return WatchAndEarnPage(); // Replace with appropriate page
      case 2:
        return IntersialAds(); // Replace with appropriate page
      case 3:
        return GiftPage(); // Replace with appropriate page
      default:
        return Container(); // Default fallback
    }
  }

  Widget _buildCard({
    required BuildContext context,
    required Color color,
    required String title,
    required String imageurl,
    required Widget page,
  }) {
    return Card(
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => page),
          );
        },
        child: Container(
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white.withOpacity(0.2),
                  ),
                  child: Image.asset(imageurl),
                ),
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
