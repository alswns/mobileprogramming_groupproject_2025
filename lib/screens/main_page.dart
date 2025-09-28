import 'package:flutter/material.dart';

import 'package:mobileprogramming_groupproject_2025/screens/login_page.dart';
import 'package:mobileprogramming_groupproject_2025/screens/chat_bot_page.dart';
import 'package:mobileprogramming_groupproject_2025/screens/history_page.dart';
import 'package:mobileprogramming_groupproject_2025/screens/setting_page.dart';
import 'package:mobileprogramming_groupproject_2025/screens/home_page.dart';

import 'package:mobileprogramming_groupproject_2025/components/CartButton.dart';


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
    'Home Page',       // _selectedIndex가 0일 때
    'ChatBot Page',    // _selectedIndex가 1일 때
    'History Page',    // _selectedIndex가 2일 때
    'Setting Page',    // _selectedIndex가 3일 때
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
            _titles[_selectedIndex], // <--- 여기서 동적으로 제목을 가져옴
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,

          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                print('검색기능 구현');
              },
            ),
            const CartIcon(),
            const SizedBox(width: 8),
          ]
        ),
        body: IndexedStack(
          index: _selectedIndex, // 현재 인덱스에 해당하는 위젯만 표시
          children: _screens, // 모든 화면 위젯 리스트
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.play_arrow), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'ChatBot'),
            BottomNavigationBarItem(icon: Icon(Icons.history_toggle_off), label: 'History'),
            BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Setting'),
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