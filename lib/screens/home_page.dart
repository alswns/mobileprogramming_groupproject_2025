import 'package:flutter/material.dart';
import 'package:mobileprogramming_groupproject_2025/widgets/cosmetic_info_widget.dart';
import 'package:mobileprogramming_groupproject_2025/models/cosmetic_item.dart';

class HomePage extends StatefulWidget{
  const HomePage({super.key});
  @override
  State <HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{
  // 예시 데이터
  final List<CosmeticItem> cosmeticItems = [
    CosmeticItem(title: '보습 크림', rating: 5, category: '스킨케어', priceRange: '2만원대', supportingText: '겨울철 보습에 탁월'),
    CosmeticItem(title: '매트 틴트', rating: 4, category: '메이크업', priceRange: '3만원대', supportingText: '지속력 좋음, 웜톤 추천'),
    CosmeticItem(title: '버블 클렌저', rating: 5, category: '클렌징', priceRange: '1만원대', supportingText: '순하고 거품 풍부, 민감성'),
    CosmeticItem(title: '데일리 선크림', rating: 3, category: '선케어', priceRange: '4만원대', supportingText: '백탁 없이 산뜻함, 끈적임 없음'),
    CosmeticItem(title: '아로마 바디로션', rating: 5, category: '바디', priceRange: '5천원대', supportingText: '시트러스 향, 대용량'),
    CosmeticItem(title: '콜라겐 에센스', rating: 4, category: '스킨케어', priceRange: '6만원대', supportingText: '주름 개선 기능성, 탄력 강화'),
    CosmeticItem(title: '내추럴 립밤', rating: 3, category: '메이크업', priceRange: '1만원대', supportingText: '건조한 입술에 보습 제공'),
    CosmeticItem(title: '딥 클렌징 오일', rating: 5, category: '클렌징', priceRange: '3만원대', supportingText: '강력한 세정력, 2차 세안 불필요'),
    CosmeticItem(title: '수분 앰플', rating: 5, category: '스킨케어', priceRange: '7만원대', supportingText: '하루 종일 촉촉하게 유지'),
    CosmeticItem(title: '파운데이션', rating: 4, category: '메이크업', priceRange: '4만원대', supportingText: '커버력 우수, 얇게 밀착'),
    CosmeticItem(title: '클렌징 워터', rating: 5, category: '클렌징', priceRange: '2만원대', supportingText: '저자극 클렌징, 잔여물 없이 깔끔'),
    CosmeticItem(title: '톤업 선스틱', rating: 3, category: '선케어', priceRange: '3만원대', supportingText: '간편한 덧바르기, 자연스러운 톤업'),
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: cosmeticItems.length,
      itemBuilder: (BuildContext context, int index) {
        final item = cosmeticItems[index];
        return CosmeticInfoWidget(
          item: item,
        );
      },
    );
  }
}