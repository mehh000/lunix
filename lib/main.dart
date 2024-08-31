import 'package:flutter/material.dart';
import 'package:lunix/MainScreens/giftpage.dart';
import 'package:lunix/MainScreens/home.dart';
import 'package:lunix/MainScreens/profile.dart';
import 'package:lunix/setting/setting.dart';
import 'package:lunix/MainScreens/spinerweel.dart';
import 'package:lunix/MainScreens/ticketpage.dart';
import 'package:lunix/Provider/GlobalProvider.dart';
import 'package:lunix/introPage/introPage.dart';
import 'package:lunix/setting/privacy.dart';
import 'package:provider/provider.dart';
import 'package:lunix/introPage/splashScreen.dart';


void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => GlobalProvider()),
      ],
      child: const MyApp(),
    ),
  );
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SettingsPage()
      );
    
  }
}
