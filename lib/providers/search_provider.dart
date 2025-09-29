import 'package:flutter/material.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:mobileprogramming_groupproject_2025/models/search_item.dart';

class SearchWidgetNotifier extends StateNotifier<SearchItem> {
  SearchWidgetNotifier() : super(SearchItem());

  final TextEditingController namecontroller = TextEditingController();
  final TextEditingController pricecontroller = TextEditingController();

  void updateType(String newType) {
    state = state.copyWith(type: newType);
  }

  void updatePrice(String newPrice) {
    state = state.copyWith(price: newPrice);
  }

  void saveData() {
    if (state.type.isNotEmpty || state.price.isNotEmpty) {
      print('종류: ${state.type}, 금액: ${state.price}'); // 실제 데이터 저장 로직 필요
      namecontroller.clear();
      pricecontroller.clear();
      state = SearchItem();
    } else {
      print('⚠️ 저장할 데이터가 없어 저장하지 않습니다.'); // 경고 메시지 출력
    }
  }

  @override
  void dispose() {
    namecontroller.dispose();
    pricecontroller.dispose();
    super.dispose();
  }
}

final searchWidgetProvider = StateNotifierProvider<SearchWidgetNotifier, SearchItem>((ref) {
  return SearchWidgetNotifier();
});