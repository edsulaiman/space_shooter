import 'dart:convert';

class Vector2Model {
  final double x;
  final double y;

  Vector2Model({
    required this.x,
    required this.y,
  });

  Vector2Model copyWith({
    double? x,
    double? y,
  }) {
    return Vector2Model(
      x: x ?? this.x,
      y: y ?? this.y,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'x': x,
      'y': y,
    };
  }

  factory Vector2Model.fromMap(Map<String, dynamic> map) {
    return Vector2Model(
      x: map['x'] as double,
      y: map['y'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory Vector2Model.fromJson(String source) =>
      Vector2Model.fromMap(json.decode(source) as Map<String, dynamic>);
}
