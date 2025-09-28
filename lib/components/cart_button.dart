import  'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobileprogramming_groupproject_2025/providers/cart_provider.dart';

class CartIcon extends ConsumerWidget {
  // App Bar에서 사용할 CartIcon
  const CartIcon({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final itemCount = ref.watch(cartProvider).length;
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