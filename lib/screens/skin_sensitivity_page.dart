import 'package:flutter/material.dart';

class SkinSensitivityPage extends StatefulWidget {
  const SkinSensitivityPage({super.key});

  @override
  State<SkinSensitivityPage> createState() => _SkinSensitivityPageState();
}

class _SkinSensitivityPageState extends State<SkinSensitivityPage> {
  final List<String> sensitivities = ['예민성', '알레르기 반응', '붉은기', '해당없음'];

  final Set<String> selectedSensitivities = {};

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
              '피부 민감도를 선택해주세요',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 8),
            Text(
              '해당되는 모든 항목을 골라주세요.',
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
                children: sensitivities.map((label) {
                  final isSelected = selectedSensitivities.contains(label);
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        if (isSelected) {
                          selectedSensitivities.remove(label);
                        } else {
                          selectedSensitivities.add(label);
                        }
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
                        child: Text(
                          label,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
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
                onPressed: selectedSensitivities.isNotEmpty
                    ? () {
                        // 다음 단계로 이동하거나 결과 활용
                        // 예시: Navigator.pop(context);
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
