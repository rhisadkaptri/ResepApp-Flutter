import 'package:flutter/material.dart';
import 'package:project_akhir/home_screen.dart';
import 'package:project_akhir/collect_screen.dart';
import 'package:project_akhir/profile_screen.dart';
import 'package:project_akhir/provider/resep_provider.dart';
import 'package:provider/provider.dart';

class Menu extends StatefulWidget {
  final ResepProvider provider;
  const Menu({
    Key? key,
    required this.provider,
  }) : super(key: key);

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  int _selectedPage = 0;

  void _changePage(int index) {
    setState(() {
      _selectedPage = index;
    });
  }

  final page = [
    Consumer<ResepProvider>(
      builder: (context, value, child) {
        return HomeScreen(
          manager: value,
        );
      },
    ),
    Consumer<ResepProvider>(
      builder: (context, value, child) {
        return CollectScreen(
          manager: value,
        );
      },
    ),
    const Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: page[_selectedPage],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmarks_rounded),
            label: 'Collections',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        // selectedLabelStyle: TextStyle(
        //   color: Colors.black,
        // ),
        // selectedIconTheme: IconThemeData(color: Colors.yellow),
        currentIndex: _selectedPage,
        selectedItemColor: const Color.fromARGB(255, 211, 14, 14),
        unselectedItemColor: Colors.grey,
        showSelectedLabels: true,
        onTap: _changePage,
      ),
    );
  }
}
