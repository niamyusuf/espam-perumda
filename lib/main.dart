import 'package:espam/view/Screens/content/dashboard.dart';
import 'package:espam/view/rekomtek/listrekomtek.dart';
import 'package:espam/view/timeline/tl_rekomtek.dart';
import 'package:flutter/material.dart';

import 'splashscreen.dart';
import 'view/alihkelola/list_alihkelola.dart';
import 'view/rekomtek/frm_new_rekomtek.dart';
import 'view/login/login.dart';
import 'fluid_nav_bar.dart';
import 'view/sipa/list_sipa.dart';

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
        "/": (ctx) => const SplashScreen(),
        "login": (ctx) => const LoginScreen(),
        "navbar": (ctx) => const Navbar(),
        "dasboard": (ctx) => const Dashboard(),
        "listrekomtek": (ctx) => const ListRekomtek(),
        "daftar_rekomtek": (ctx) => const FormDaftarRekomtek(),
        "listAlihKelola": (ctx) => const ListAlihKelola(),
        "listSipa": (ctx) => const ListSipa(),
        
      },
      // home: const LoginScreen(),
    );
  }
}
