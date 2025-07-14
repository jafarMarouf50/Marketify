part of '../index.dart';
class RecentOrder {
  final String id;
  final String customer;
  final String product;
  final String amount;
  final String status;
  final String time;
  final String avatar;

  RecentOrder({
    required this.id,
    required this.customer,
    required this.product,
    required this.amount,
    required this.status,
    required this.time,
    required this.avatar,
  });
}
