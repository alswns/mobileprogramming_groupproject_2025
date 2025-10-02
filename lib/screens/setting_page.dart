import 'package:flutter/material.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});
  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  bool counseling24x7 = true;
  bool darkMode = false;

  int currentIndex = 3;

  void onBottomTap(int idx) {
    setState(() => currentIndex = idx);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: const Color(0xFFF4EEF6),

      // AppBar는 유지하되 높이를 0으로 만들어 레이아웃 차지 X
      appBar: AppBar(
        toolbarHeight: 0, // 핵심
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: const Color(0xFFF4EEF6),
        // 필요하면 title을 추가할 수 있지만 높이가 0이므로 보이지 않음
      ),

      body: SafeArea(
        top: false, // 상태바 안전영역 여백 제거
        child: ListView(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 16), // top=0로 바로 붙이기
          children: [
            // 프로필 카드
            Container
              (
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
              ),
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 22,
                    backgroundColor: theme.colorScheme.primary.withOpacity(0.15),
                    child: const Text('A'),
                  ),
                  const SizedBox(width: 12),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Puang', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                        SizedBox(height: 4),
                        Text('dry skin, sensitive skin, 23, male', style: TextStyle(color: Colors.grey)),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                          title: const Text('Logout'),
                          content: const Text('Are you sure you want to logout?'),
                          actions: [
                            TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancel')),
                            FilledButton(onPressed: () {/* TODO: logout */}, child: const Text('Yes')),
                          ],
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF7451B6),
                      shape: const StadiumBorder(),
                      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                    ),
                    child: const Text('Logout', style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            ListTile(
              title: const Text('notification'),
              subtitle: const Text("choosing the notification’s type"),
              leading: const Icon(Icons.notifications_none),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {},
            ),

            const Divider(height: 1),
            ListTile(
              title: const Text('like'),
              subtitle: const Text('checking the liked list'),
              leading: const Icon(Icons.favorite_border),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {},
            ),

            const Divider(height: 1),
            ListTile(
              title: const Text('counseling'),
              subtitle: const Text('I provide 24/7 professional counseling.'),
              leading: const Icon(Icons.support_agent_outlined),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  DecoratedBox(
                    decoration: BoxDecoration(color: Color(0xFFB046E3), shape: BoxShape.circle),
                    child: SizedBox(width: 8, height: 8),
                  ),
                  SizedBox(width: 8),
                  Icon(Icons.chevron_right),
                ],
              ),
              onTap: () {},
            ),

            const Divider(height: 1),
            SwitchListTile.adaptive(
              title: const Text('dark mode'),
              subtitle: const Text('choosing the theme of my app'),
              secondary: const Icon(Icons.dark_mode_outlined),
              value: darkMode,
              onChanged: (v) => setState(() => darkMode = v),
            ),

            const Divider(height: 1),
            ListTile(
              title: const Text('language setting'),
              subtitle: const Text('choosing a favorite language'),
              leading: const Icon(Icons.language),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {},
            ),

            const Divider(height: 1),
            ListTile(
              title: const Text('blocking products'),
              subtitle: const Text('view your blocking products'),
              leading: const Icon(Icons.block_outlined),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {},
            ),

            const Divider(height: 1),
            ListTile(
              title: const Text('App update'),
              subtitle: const Text('25.36.0(250201)'),
              leading: const Icon(Icons.system_update_alt_outlined),
              onTap: () {},
            ),
          ],
        ),
      ),

      // 필요 시 하단 네비게이션 바
      // bottomNavigationBar: BottomNavigationBar(
      //   currentIndex: currentIndex,
      //   onTap: onBottomTap,
      //   type: BottomNavigationBarType.fixed,
      //   items: const [
      //     BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'Home'),
      //     BottomNavigationBarItem(icon: Icon(Icons.chat_bubble_outline), label: 'ChatBot'),
      //     BottomNavigationBarItem(icon: Icon(Icons.history), label: 'History'),
      //     BottomNavigationBarItem(icon: Icon(Icons.settings_outlined), label: 'Setting'),
      //   ],
      // ),
    );
  }
}