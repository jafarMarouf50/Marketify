part of '../index.dart';

abstract class SplashState {}

class DisplaySplash extends SplashState {}

class Authenticated extends SplashState {
  final String role;

  Authenticated({required this.role});
}

class UnAuthenticated extends SplashState {}
