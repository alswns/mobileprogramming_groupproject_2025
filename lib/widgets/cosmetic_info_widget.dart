import 'package:flutter/material.dart';
import 'package:mobileprogramming_groupproject_2025/models/cosmetic_item.dart';
import 'package:mobileprogramming_groupproject_2025/providers/cart_provider.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class CosmeticInfoWidget extends ConsumerWidget { //화장품 설명 위젯
  // final Image  image; 나중에 이미지 추가를 위해 일단은..
  final CosmeticItem item;

  const CosmeticInfoWidget({
    super.key,
    required this.item
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return InkWell(
      // 탭했을 때 실행할 콜백 함수를 여기에 작성합니다.
        onTap: () {
          print('${item.title} 위젯 상세 페이지 이동');
        },
        child : Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start, // 상단 정렬
          children: <Widget>[
            //왼쪽 아이콘/이미지 영역
            Container(
              width: 70,
              height: 80,
              decoration: BoxDecoration(
                color: Colors.grey[300], // 배경 회색
                borderRadius: BorderRadius.circular(10), // 둥근 모서리
              ),
              child: const Center(
                // 이미지 대신 임시 아이콘 사용
                child: Icon(Icons.palette_outlined, size: 40, color: Colors.grey),
              ),
            ),

            const SizedBox(width: 12), // 아이콘과 텍스트 사이 간격

            // 오른쪽 텍스트/정보 영역 (남은 공간 모두 차지)
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start, // 왼쪽 정렬
                children: <Widget>[
                  // 제목 영역, 별점 나중에 구현
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // 제목
                      Text(
                        item.title,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),

                      // 하트 아이콘 눌렸을 때 상태 구현해야됨
                      Row(
                        children: [
                          IconButton(
                              onPressed: () {
                                ref.read(cartProvider.notifier).addItem(item);
                                print('장바구니에 아이템 추가!');
                              },
                              icon:  Icon(Icons.add_shopping_cart, color: Colors.grey, size: 20),
                          ),
                          const SizedBox(width: 8),
                          const Icon(Icons.favorite_border, color: Colors.grey, size: 20),
                        ],
                      ),
                    ],
                  ),

                  const SizedBox(height: 1),

                  // 카테고리, 가격
                  Text(
                    item.category + "-" + item.priceRange,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                  ),

                  const SizedBox(height: 4),

                  // 하단 설명 텍스트
                  Text(
                    item.supportingText,
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey[700],
                    ),
                    maxLines: 1, // 한 줄만 표시하고 넘어가는 텍스트는 ... 처리
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}