import 'package:flutter/material.dart';

abstract class AppStyles {
  static TextStyle styleRegular14(BuildContext context) {
    return const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.normal,
    );
  }

  static TextStyle styleMedium14(BuildContext context) {
    return const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle styleSemiBold14(BuildContext context) {
    return const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle styleRegular16(BuildContext context) {
    return const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.normal,
    );
  }

  static TextStyle styleMedium16(BuildContext context) {
    return const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle styleBold16(BuildContext context) {
    return const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle styleMedium18(BuildContext context) {
    return const TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w500,
      fontStyle: FontStyle.italic,
    );
  }

  static TextStyle styleSemiBold18(BuildContext context) {
    return const TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle styleBold18(BuildContext context) {
    return const TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle styleRegular20(BuildContext context) {
    return const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.normal,
    );
  }

  static TextStyle styleBold20(BuildContext context) {
    return const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle styleRegular23(BuildContext context) {
    return const TextStyle(
      fontSize: 23,
      fontWeight: FontWeight.normal,
    );
  }

  static TextStyle styleRegular30(BuildContext context) {
    return const TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.normal,
    );
  }
}
