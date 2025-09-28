import 'package:flutter/material.dart';

class CustomListItem extends StatelessWidget {
  // final Image  image;
  final String title;
  final double rating;
  final String category;
  final String priceRange;
  final String supportingText;

  const CustomListItem({
    super.key,
    required this.title,
    required this.rating,
    required this.category,
    required this.priceRange,
    required this.supportingText,
  });

  @override
  Widget build(BuildContext context) {
    // 텍스트와 별점 영역을 가로로 나누는 Row를 포함한 전체 컨테이너
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start, // 상단 정렬
        children: <Widget>[
          // 1. 왼쪽 아이콘/이미지 영역
          Container(
            width: 70,
            height: 70,
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

          // 2. 오른쪽 텍스트/정보 영역 (남은 공간 모두 차지)
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, // 왼쪽 정렬
              children: <Widget>[
                // 2-1. 제목 및 별점 영역 (Row)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // 제목
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),

                    // 별점 및 하트 아이콘
                    Row(
                      children: [
                        const SizedBox(width: 8),
                        const Icon(Icons.favorite_border, color: Colors.grey, size: 20),
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: 4),

                // 2-2. 카테고리, 가격대, 거리 영역 (Row)
                Text(
                  '$category • $priceRange',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),

                const SizedBox(height: 4),

                // 2-3. 하단 설명 텍스트
                Text(
                  supportingText,
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
    );
  }
}