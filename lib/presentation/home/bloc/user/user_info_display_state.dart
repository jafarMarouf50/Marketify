part of '../../index.dart';

@immutable
sealed class UserInfoDisplayState {}

final class UserInfoDisplayLoading extends UserInfoDisplayState {}

final class UserInfoDisplayLoaded extends UserInfoDisplayState {
  final UserEntity user;

  UserInfoDisplayLoaded({required this.user});
}

final class LoadUserFailure extends UserInfoDisplayState {
  final String errMsg;

  LoadUserFailure({required this.errMsg});
}
