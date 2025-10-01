import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobileprogramming_groupproject_2025/screens/login_page.dart';
import 'package:mobileprogramming_groupproject_2025/screens/main_page.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

const storage = FlutterSecureStorage();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'mobileprogramming-groupproject',
      home: AuthChecker(),
      routes: {
        '/login': (context) => LoginPage(),
        '/main': (context) => MainPage(),
      },
    );
  }
}

class AuthChecker extends StatelessWidget {
  const AuthChecker({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: checkTokenAsync(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // 로딩 중일 때 스플래시 화면
          return Scaffold(body: Center(child: CircularProgressIndicator()));
        }

        if (snapshot.hasData && snapshot.data == true) {
          // 토큰이 존재하면 MainPage
          return MainPage();
        } else {
          // 토큰이 없으면 LoginPage
          return LoginPage();
        }
      },
    );
  }
}

Future<bool> checkTokenAsync() async {
  try {
    final String? refreshToken = await storage.read(key: 'refresh_token');
    print("refreshToken: $refreshToken");
    return refreshToken != null && refreshToken.isNotEmpty;
  } catch (e) {
    print('토큰 확인 중 오류: $e');
    return false;
  }
}
