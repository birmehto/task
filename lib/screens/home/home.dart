import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:test/model/login.dart';
import 'package:test/screens/home/history.dart';
import 'package:test/screens/home/leave.dart';
import 'package:test/screens/home/profile.dart';
import 'package:test/screens/home/setting.dart';
import 'package:test/screens/scanner.dart';

class HomeScreen extends StatefulWidget {
  final LoginModel? loginResult;
  const HomeScreen({super.key, this.loginResult});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  List<Widget> _pages = [];

  @override
  void initState() {
    _pages = [
      Center(child: MyProfile(loginResult: widget.loginResult)),
      const Center(child: LeavePage()),
      const Center(child: HistoryPage()),
      const Center(child: SettingPage()),
    ];

    super.initState();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      floatingActionButton: FloatingActionButton(
        elevation: 6,
        backgroundColor: Colors.black,
        shape: const CircleBorder(),
        onPressed: () {
          Get.to(() => const QRViewExample());
        },
        child: const Icon(
          Icons.camera_sharp,
          size: 32,
          color: Colors.white70,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        shape: const CircularNotchedRectangle(),
        notchMargin: 5.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            buildNavBarItem(Icons.dashboard_rounded, 'Home', 0),
            buildNavBarItem(Icons.list, 'Leave', 1),
            const SizedBox(width: 40.0),
            buildNavBarItem(Icons.history_sharp, 'History', 2),
            buildNavBarItem(Icons.settings, 'Setting', 3),
          ],
        ),
      ),
    );
  }

  Widget buildNavBarItem(IconData icon, String label, int index) {
    return InkWell(
      onTap: () {
        _onItemTapped(index);
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon,
              color: _selectedIndex == index ? Colors.blue : Colors.grey),
          Text(
            label,
            style: TextStyle(
              color: _selectedIndex == index ? Colors.blue : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
