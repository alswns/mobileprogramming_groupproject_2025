import 'package:flutter/material.dart';

import 'package:mobileprogramming_groupproject_2025/screens/login_page.dart';
import 'package:mobileprogramming_groupproject_2025/screens/chat_bot_page.dart';
import 'package:mobileprogramming_groupproject_2025/screens/history_page.dart';
import 'package:mobileprogramming_groupproject_2025/screens/setting_page.dart';
import 'package:mobileprogramming_groupproject_2025/screens/home_page.dart';

import 'package:mobileprogramming_groupproject_2025/components/cart_button.dart';


class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>{
  int _selectedIndex = 0;

  final List<Widget> _screens = <Widget>[
    const HomePage(),
    const ChatBotPage(),
    const HistoryPage(),
    const SettingPage(),
  ];

  final List<String> _titles = const [
    'Home Page',
    'ChatBot Page',
    'History Page',
    'Setting Page',
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
          title: Text(
            _titles[_selectedIndex], //제목
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,

          actions: [
            IconButton(
              icon: const Icon(Icons.search), // 검색
              onPressed: () {
                print('검색기능 구현');
              },
            ),
            const CartIcon(), // 카트
            const SizedBox(width: 8),
          ]
        ),
        body: IndexedStack(
          index: _selectedIndex,
          children: _screens,
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.play_arrow), label: 'Home'), // body만 구현
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'ChatBot'), // body만 구현
            BottomNavigationBarItem(icon: Icon(Icons.history_toggle_off), label: 'History'), // body만 구현
            BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Setting'), // body만 구현
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          type: BottomNavigationBarType.fixed,
          onTap: _onItemTapped, // 탭 클릭 시 상태 변경
        ),
    );
  }
}