import 'package:flutter/material.dart';
import 'package:lunix/MainScreens/globalchat.dart';
import 'package:lunix/MainScreens/notification.dart';
import 'package:lunix/MainScreens/profile.dart';
import 'package:lunix/components/balance%20card.dart';
import 'package:lunix/components/home_body.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        scrolledUnderElevation: 0,
        backgroundColor: Colors.transparent,
        toolbarHeight: 70,
       flexibleSpace: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
         children: [

           Row(
             children: [
              SizedBox(width: 10,),
               Container(
                  // Adjust margin as needed
                  
                  child: Material(
                    
                    elevation: 8, // Elevation for shadow
                    shape: CircleBorder(),
                    child: Center(
                      // Center the icon
                      child: IconButton(
                        onPressed: () {
                           Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => NotificationPage()),
                  );
                        },
                        icon: Icon(
                          Icons.notifications,
                          color: Colors.blue,
                          size: 40, // Adjust size if needed
                        ),
                      ),
                    ),
                  ),
                ),
             ],
           ),
           Row(
            children: [
               GestureDetector(
                 onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => GlobalCommunicationPage()),
                  );
                },
                 child: Container(
                  margin: EdgeInsets.only(right: 20),
                  child: Material(
                    elevation: 8, // Elevation for shadow
                    shape: CircleBorder(),
                    child: SizedBox(
                      width: 50,
                      height: 50,
                      child: ClipOval(
                        child: Image.asset(
                          'assets/icons8-global-64.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                               ),
               ),
              GestureDetector(
                 onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProfilePage()),
                  );
                },
                child: Container(
                  margin: EdgeInsets.only(right: 20),
                  child: Material(
                    elevation: 8, // Elevation for shadow
                    shape: CircleBorder(),
                    child: SizedBox(
                      width: 50,
                      height: 50,
                      child: ClipOval(
                        child: Image.asset(
                          'assets/user.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
           ),
         ],
       ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            
            CustomCard(),
            SizedBox(height: 30,),
            BodyOfHomepage()],
        ),
      ),
    );
  }
}
