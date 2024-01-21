import 'package:espam/view/Screens/content/dashboard.dart';
import 'package:espam/view/Screens/content/profile.dart';
import 'package:espam/view/Screens/content/setting.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late int _page = 0;

  final List _widgetOptions = [
    const Dashboard(),
    const Profile(),
    const Setting(),
    const Setting(),
  ];

  final List<NavItem> _navItems = [
    NavItem(Icons.shopping_bag, "Shop"),
    NavItem(Icons.money, "Money"),
    NavItem(Icons.currency_bitcoin, "Bitcoin"),
    NavItem(Icons.bar_chart, "Chart"),
  ];

  void _onNavItemTapped(int index) {
    setState(() {
      _page = index;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
      ),
      body: _widgetOptions.elementAt(_page),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 2, 68, 122),
        onPressed: () {},
        child: const Icon(Icons.home_filled),
      ),
      bottomNavigationBar: BottomAppBar(
        color: const Color.fromARGB(255, 2, 68, 122),
        shape: const CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: _navItems.map((item) {
            var index = _navItems.indexOf(item);
            return IconButton(
              onPressed: () {
                _onNavItemTapped(index);
              },
              icon: Icon(
                item.icon,
                color: _page == index ? Colors.orange : Colors.white,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

class NavItem {
  IconData icon;
  String title;

  NavItem(this.icon, this.title);
}
