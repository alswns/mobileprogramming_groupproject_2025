import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:mobileprogramming_groupproject_2025/models/cosmetic_item.dart';


class CartNotifier extends StateNotifier<List<CosmeticItem>> { //cart 상태관리

  CartNotifier() : super([]);
  //장바구니 초기상태
  void addItem(CosmeticItem item) {
    state = [...state, item];
  }
  //장바구니 추가

  void removeItem(String title) {
    state = state.where((item) => item.title != title).toList();
  }
  //장바구니 없애기

  void clearCart() {
    state = [];
  }
  //장바구니 초기화
}

final cartProvider = StateNotifierProvider<CartNotifier, List<CosmeticItem>>((ref) {
  //StateNotifierProvider 상태를 변경하는 로직과 변경될 수 있는 값을 모두 관리
  // Provider가 초기화될 때 Notifier 인스턴스를 반환
  return CartNotifier();
});