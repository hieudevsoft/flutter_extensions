// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class SembastModel {
  int? id;

  final String name;
  final bool isOld;
  SembastModel({
    required this.name,
    required this.isOld,
    this.id,
  });

  SembastModel copyWith({
    int? id,
    String? name,
    bool? isOld,
  }) {
    return SembastModel(
      id: id ?? this.id,
      name: name ?? this.name,
      isOld: isOld ?? this.isOld,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'isOld': isOld,
    };
  }

  factory SembastModel.fromMap(Map<String, dynamic> map) {
    return SembastModel(
      id: map['id'] as int,
      name: map['name'] as String,
      isOld: map['isOld'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory SembastModel.fromJson(String source) => SembastModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'SembastModel(id: $id, name: $name, isOld: $isOld)';

  @override
  bool operator ==(covariant SembastModel other) {
    if (identical(this, other)) return true;

    return other.id == id && other.name == name && other.isOld == isOld;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ isOld.hashCode;
}
