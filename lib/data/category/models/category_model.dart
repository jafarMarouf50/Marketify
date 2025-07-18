part of '../index.dart';

class CategoryModel {
  final String title;
  final String imageUrl;

  const CategoryModel({required this.title, required this.imageUrl});

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      title: map['title'] as String,
      imageUrl: map['imageUrl'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'title': title, 'imageUrl': imageUrl};
  }

  String toJson() => json.encode(toMap());

  factory CategoryModel.fromJson(String source) =>
      CategoryModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

extension CategoryXModel on CategoryModel {
  CategoryEntity toEntity() {
    return CategoryEntity(title: title, image: imageUrl);
  }
}
