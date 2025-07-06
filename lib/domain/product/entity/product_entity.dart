part of '../index.dart';

class ProductEntity {
  final String productId;
  final String title;
  final double price;
  final List<String> imageUrl;
  final int gender;
  final String categoryId;
  final List<ProductColorEntity> colors;
  final List<String> sizes;
  final double rating;
  final double discountedPrice;
  final String salesNumber;
  final Timestamp createdDate;

  ProductEntity({
    required this.productId,
    required this.title,
    required this.price,
    required this.imageUrl,
    required this.gender,
    required this.categoryId,
    required this.colors,
    required this.sizes,
    required this.rating,
    required this.discountedPrice,
    required this.createdDate,
    required this.salesNumber,
  });
}
