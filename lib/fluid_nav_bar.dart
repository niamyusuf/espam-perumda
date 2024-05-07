import 'package:espam/view/Screens/Widget/overlay_loader_icon.dart';
import 'package:espam/view/Screens/content/dashboard.dart';
import 'package:espam/view/Screens/content/information.dart';
import 'package:espam/view/Screens/content/profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluid_bottom_nav_bar/fluid_bottom_nav_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'view/login/login.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  Widget? _child;

  Future cekLogin() async {
    // debugPrint("STS LOGIN");

    // showLoadingIndicator();
    SharedPreferences pref = await SharedPreferences.getInstance();
    debugPrint("STS LOGIN ${pref.getBool("isLogin")}");
    
    if (pref.getBool("isLogin") == false) {
      pref.setString('iduser', '');
      pref.setString('nama', '');
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) {
          return const LoginScreen();
        }),
      );
    }else{
      debugPrint("LOGIN ${pref.getBool("isLogin")}");
    }
  }

  Future cekUser() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    if (pref.getString("iduser") == null) {
      pref.setBool("isLogin", false);
      pref.setString('iduser', '');
      pref.setString('nama', '');
    }
  }

  void showLoadingIndicator() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return OverlayLoaderWithAppIcon(
          isLoading: true,
          appIcon: Image.asset(
            'assets/images/tde.png',
          ),
          child: Container(),
        );
      },
    );
  }

  void hideOpenDialog() {
    Navigator.of(context).pop();
  }

  @override
  void initState() {
    cekLogin();
    _child = const Dashboard();
    super.initState();
    // cekUser();
    
    // hideOpenDialog();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color(0xFFEAC0DC),
      extendBody: true,
      body: _child,
      bottomNavigationBar: FluidNavBar(
        icons: [
          FluidNavBarIcon(
              icon: Icons.home_outlined,
              backgroundColor: const Color.fromARGB(255, 2, 68, 122),
              extras: {"label": "Home"}),
          FluidNavBarIcon(
              icon: Icons.account_circle_outlined,
              backgroundColor: const Color.fromARGB(255, 2, 68, 122),
              extras: {"label": "Profile"}),
          FluidNavBarIcon(
              icon: CupertinoIcons.info_circle,
              backgroundColor: const Color.fromARGB(255, 2, 68, 122),
              extras: {"label": "Informasi"}),
        ],
        onChange: _handleNavigationChange,
        style: const FluidNavBarStyle(
            barBackgroundColor: Color.fromARGB(255, 2, 68, 122),
            iconSelectedForegroundColor: Colors.white,
            iconUnselectedForegroundColor: Color.fromARGB(255, 128, 223, 252)),
        scaleFactor: 1.5,
        defaultIndex: 0,
        itemBuilder: (icon, item) => Semantics(
          label: icon.extras!["label"],
          child: item,
        ),
      ),
    );
  }

  void _handleNavigationChange(int index) {
    setState(() {
      switch (index) {
        case 0:
          _child = const Dashboard();
          break;
        case 1:
          _child = const Profile();
          break;
        case 2:
          _child = const Information();
          break;
      }
      _child = AnimatedSwitcher(
        switchInCurve: Curves.easeOut,
        switchOutCurve: Curves.easeIn,
        duration: const Duration(milliseconds: 200),
        child: _child,
      );
    });
  }
}
