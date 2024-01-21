import 'package:espam/view/Screens/content/dashboard.dart';
import 'package:espam/view/Screens/content/frm_ajuan_rekomtek.dart';
import 'package:flutter/material.dart';

import 'view/Screens/login/login.dart';
import 'fluid_nav_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'e-SPAM Login',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF2661FA),
        scaffoldBackgroundColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        // "/": (ctx) => SplashScreen(),
        "/": (ctx) => const LoginScreen(),
        "navbar": (ctx) => const Navbar(),
        "dasboard": (ctx) => const Dashboard(),
        "ajuan_rktk": (ctx) => const FormAjuanRekomtek(),
      },
      // home: const LoginScreen(),
    );
  }
}
