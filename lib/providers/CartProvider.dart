import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

class CartNotifier extends StateNotifier<int>{
  // StateNotifier: 상태변화를 외부에 알림
  // <int>: 장바구니의 아이템 개수를 의미
  CartNotifier() : super(1);
  // 장바구니 초기값 0
  void addItem(){
    state = state + 1;
  }
  // 장바구니에 하나씩 추가
  void clearItem(){
    state = 0;
  }
  // 장바구니 아이템 삭제
}

final cartProvider = StateNotifierProvider<CartNotifier, int>((ref) {
  //StateNotifierProvider 상태를 변경하는 로직과 변경될 수 있는 값을 모두 관리
  // Provider가 초기화될 때 Notifier 인스턴스를 반환
  return CartNotifier();
});