import  'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobileprogramming_groupproject_2025/providers/CartProvider.dart';

class CartIcon extends ConsumerWidget {
  // App Bar에서 사용할 CartIcon
  const CartIcon({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ref.watch()를 사용하여 cartProvider가 관리하는 상태(int, 아이템 개수)를 구독합니다.
    // 상태가 변경되면 이 위젯만 자동으로 리빌드됩니다.
    final itemCount = ref.watch(cartProvider);

    return Stack(
      alignment: Alignment.center,
      children: [
        IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              print('장바구니 페이지');
            },
        ),
        if (itemCount > 0)
          Positioned(
            right: 0,
            top: 0,
            child: Container(
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(10),
              ),
              constraints: const BoxConstraints(
                minWidth: 16,
                minHeight: 16,
              ),
              child: Text(
                '$itemCount',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
      ],
    );
  }
}