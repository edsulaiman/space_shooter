import 'dart:convert';

import 'shop_item_model.dart';

class ProgressModel {
  final int coins;
  final List<ShopItemModel> shopItems;

  ProgressModel({
    required this.coins,
    required this.shopItems,
  });

  ProgressModel copyWith({
    int? coins,
    List<ShopItemModel>? shopItems,
  }) {
    return ProgressModel(
      coins: coins ?? this.coins,
      shopItems: shopItems ?? this.shopItems,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'coins': coins,
      'shopItems': shopItems.map((x) => x.toMap()).toList(),
    };
  }

  factory ProgressModel.fromMap(Map<String, dynamic> map) {
    return ProgressModel(
      coins: map['coins'] as int,
      shopItems: List<ShopItemModel>.from(
        (map['shopItems'] as List<int>).map<ShopItemModel>(
          (x) => ShopItemModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory ProgressModel.fromJson(String source) =>
      ProgressModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
