import 'package:flutter/material.dart';
import 'package:scratch/pages/welcomePage.dart';

import 'listpage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentPage = 0;

  setCurrentPage(int page) {
    setState(() {
      _currentPage = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const [
          Text("Home Page"),
        Text('List Page')
        ][_currentPage],
        backgroundColor: const Color(0x8000ff00),
      ),
      body: [
        const WelcomePage(),
        const ListPage(),
      ][_currentPage],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentPage,
        onTap: (page) => setCurrentPage(page),
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.black,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Welcome",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: "List",
          ),
        ],
      ),
    );
  }
}
