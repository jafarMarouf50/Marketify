part of '../index.dart';

@immutable
sealed class QuantityState {}

final class QuantityInitial extends QuantityState {}

final class QuantityIncrease extends QuantityState {}

final class QuantityDecrease extends QuantityState {}
