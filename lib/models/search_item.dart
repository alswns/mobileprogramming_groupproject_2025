class SearchItem {
  final String type;
  final String price;

  SearchItem({this.type = '', this.price = ''});

  SearchItem copyWith({String? type, String? price}) {
    return SearchItem(
      type: type ?? this.type,
      price: price ?? this.price,
    );
  }
}