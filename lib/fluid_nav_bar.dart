import 'package:espam/view/Screens/content/dashboard.dart';
import 'package:espam/view/Screens/content/profile.dart';
import 'package:espam/view/Screens/content/setting.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluid_bottom_nav_bar/fluid_bottom_nav_bar.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  Widget? _child;

  @override
  void initState() {
    _child = const Dashboard();
    super.initState();
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
              icon: Icons.home,
              backgroundColor: const Color.fromARGB(255, 2, 68, 122),
              extras: {"label": "Home"}),
          FluidNavBarIcon(
              icon: Icons.account_circle,
              backgroundColor: const Color.fromARGB(255, 2, 68, 122),
              extras: {"label": "Profile"}),
          FluidNavBarIcon(
              icon: CupertinoIcons.question_circle,
              backgroundColor: const Color.fromARGB(255, 2, 68, 122),
              extras: {"label": "Tentang"}),
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
          _child = const Setting();
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
