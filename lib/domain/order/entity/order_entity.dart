part of '../index.dart';

class OrderEntity {
  final String orderNumber;
  final int itemCount;
  final List<OrderStatusEntity> orderStatus;

  OrderEntity({
    required this.orderNumber,
    required this.itemCount,
    required this.orderStatus,
  });
}
