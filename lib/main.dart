import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobileprogramming_groupproject_2025/screens/login_page.dart';
import 'package:mobileprogramming_groupproject_2025/screens/main_page.dart';

void main() {
  runApp(
      const ProviderScope(
          child: MyApp(),
      ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter 라우트 예제',
      initialRoute: '/home',
      routes: {
        '/home' : (context) => MainPage(),
        '/login': (context) => LoginPage(),
        // '/second': (context) => SecondPage(),
      },
    );
  }
}
