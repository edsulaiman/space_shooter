import 'dart:convert';

import 'spaceship_model.dart';

class ShopItemModel {
  final SpaceshipModel spaceship;
  final String name;
  final int level;
  final int price;
  final int value;

  ShopItemModel({
    required this.spaceship,
    required this.name,
    required this.level,
    required this.price,
    required this.value,
  });

  ShopItemModel copyWith({
    SpaceshipModel? spaceship,
    String? name,
    int? level,
    int? price,
    int? value,
  }) {
    return ShopItemModel(
      spaceship: spaceship ?? this.spaceship,
      name: name ?? this.name,
      level: level ?? this.level,
      price: price ?? this.price,
      value: value ?? this.value,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'spaceship': spaceship.toMap(),
      'name': name,
      'level': level,
      'price': price,
      'value': value,
    };
  }

  factory ShopItemModel.fromMap(Map<String, dynamic> map) {
    return ShopItemModel(
      spaceship:
          SpaceshipModel.fromMap(map['spaceship'] as Map<String, dynamic>),
      name: map['name'] as String,
      level: map['level'] as int,
      price: map['price'] as int,
      value: map['value'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory ShopItemModel.fromJson(String source) =>
      ShopItemModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
