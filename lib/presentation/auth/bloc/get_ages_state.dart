part of '../index.dart';

@immutable
sealed class GetAgesState {}

final class GetAgesInitial extends GetAgesState {}

final class GetAgesLoading extends GetAgesState {}

final class GetAgesLoaded extends GetAgesState {
  final List<QueryDocumentSnapshot<Map<String, dynamic>>> ages;

  GetAgesLoaded({required this.ages});
}

final class GetAgesFailure extends GetAgesState {
  final String errMsg;

  GetAgesFailure({required this.errMsg});
}
