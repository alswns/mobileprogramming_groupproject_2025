import 'package:flutter/material.dart';
import 'package:mobileprogramming_groupproject_2025/screens/login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter 라우트 예제',
      initialRoute: '/login',

      routes: {
        '/login': (context) => LoginPage(),
        // '/second': (context) => SecondPage(),
      },
    );
  }
}
