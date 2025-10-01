import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

const storage = FlutterSecureStorage();

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Card(
              child: ListTile(
                leading: Icon(Icons.logout),
                title: Text('로그아웃'),
                subtitle: Text('계정에서 로그아웃합니다'),
                onTap: () async {
                  // 토큰 삭제
                  await storage.delete(key: 'access_token');
                  await storage.delete(key: 'refresh_token');

                  // 로그인 페이지로 이동 (스택 초기화)
                  if (context.mounted) {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      '/login',
                      (Route<dynamic> route) => false,
                    );
                  }
                },
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.info),
                title: Text('앱 정보'),
                subtitle: Text('버전 1.0.0'),
                onTap: () {
                  showAboutDialog(
                    context: context,
                    applicationName: 'Cosmetic App',
                    applicationVersion: '1.0.0',
                    children: [Text('화장품 정보를 제공하는 앱입니다.')],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
