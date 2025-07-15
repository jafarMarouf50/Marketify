part of '../index.dart';

enum PasswordStrength {
  none(0.0, 'Too weak', Colors.grey),
  weak(0.33, 'Weak', Colors.red),
  medium(0.66, 'Medium', Colors.orange),
  strong(1.0, 'Strong', Colors.green);

  final double value;
  final String label;
  final Color color;

  const PasswordStrength(this.value, this.label, this.color);
}

PasswordStrength checkPasswordStrength(String password, {int minLength = 8}) {
  if (password.isEmpty) return PasswordStrength.none;

  bool hasUppercase = password.contains(RegExp(r'[A-Z]'));
  bool hasLowercase = password.contains(RegExp(r'[a-z]'));
  bool hasDigits = password.contains(RegExp(r'[0-9]'));
  bool hasSpecialCharacters = password.contains(
    RegExp(r'[!@#$%^&*(),.?":{}|<>]'),
  );
  int length = password.length;

  int score = 0;
  if (length >= minLength) score++;
  if (length >= 10) score++;
  if (hasUppercase) score++;
  if (hasLowercase) score++;
  if (hasDigits) score++;
  if (hasSpecialCharacters) score++;

  if (score >= 5) return PasswordStrength.strong;
  if (score >= 3) return PasswordStrength.medium;
  return PasswordStrength.weak;
}