import 'dart:convert';

import 'package:flame/components.dart';

import 'vector2_model.dart';

class SpaceshipModel {
  final String name;
  final String asset;
  final Vector2 size;

  SpaceshipModel({
    required this.name,
    required this.asset,
    required this.size,
  });

  SpaceshipModel copyWith({
    String? name,
    String? asset,
    Vector2? size,
  }) {
    return SpaceshipModel(
      name: name ?? this.name,
      asset: asset ?? this.asset,
      size: size ?? this.size,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'asset': asset,
      'size': Vector2Model(x: size.x, y: size.y).toMap(),
    };
  }

  factory SpaceshipModel.fromMap(Map<String, dynamic> map) {
    final vector2Model =
        Vector2Model.fromMap(map["size"] as Map<String, dynamic>);

    return SpaceshipModel(
      name: map['name'] as String,
      asset: map['asset'] as String,
      size: Vector2(vector2Model.x, vector2Model.y),
    );
  }

  String toJson() => json.encode(toMap());

  factory SpaceshipModel.fromJson(String source) =>
      SpaceshipModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
