import 'package:flutter/material.dart';
import 'skin_sensitivity_page.dart';

class SkinTypePage extends StatefulWidget {
  const SkinTypePage({super.key});

  @override
  State<SkinTypePage> createState() => _SkinTypePageState();
}

class _SkinTypePageState extends State<SkinTypePage> {
  final List<Map<String, String>> skinTypes = [
    {'label': '건성', 'desc': 'Dry'},
    {'label': '지성', 'desc': 'Oily'},
    {'label': '복합성', 'desc': 'Combination'},
    {'label': '민감성', 'desc': 'Sensitive'},
  ];

  String? selectedType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 32),
            Icon(Icons.opacity, size: 56, color: Colors.blueAccent),
            SizedBox(height: 16),
            Text(
              '피부 타입을 선택하세요',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 8),
            Text(
              '당신의 피부 타입을 골라주세요.',
              style: TextStyle(fontSize: 16, color: Colors.grey[500]),
            ),
            SizedBox(height: 32),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                padding: EdgeInsets.symmetric(horizontal: 24),
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                childAspectRatio: 1.5,
                children: skinTypes.map((type) {
                  final isSelected = selectedType == type['label'];
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedType = type['label'];
                      });
                    },
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 200),
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(32),
                        border: Border.all(
                          color: isSelected
                              ? Colors.blueAccent
                              : Colors.transparent,
                          width: 2,
                        ),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 18,
                      ),
                      child: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              type['label']!,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                            SizedBox(height: 6),
                            Text(
                              type['desc']!,
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.grey[500],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 32.0),
              child: ElevatedButton(
                onPressed: selectedType != null
                    ? () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SkinSensitivityPage(),
                          ),
                        );
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  minimumSize: Size(180, 48),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
                child: Text(
                  '다음',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
