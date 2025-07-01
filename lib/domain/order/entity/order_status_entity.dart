part of '../index.dart';

class OrderStatusEntity {
  final String title;
  final String date;
  final bool isCompleted;
  final bool isActive;

  const OrderStatusEntity({
    required this.title,
    required this.date,
    required this.isCompleted,
    required this.isActive,
  });
}
