part of '../../index.dart';

enum PasswordStrength { none, weak, medium, strong }

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

extension PasswordStrengthX on PasswordStrength {
  double get value => switch (this) {
    PasswordStrength.none => 0.0,
    PasswordStrength.weak => 0.33,
    PasswordStrength.medium => 0.66,
    PasswordStrength.strong => 1.0,
  };

  String get label => switch (this) {
    PasswordStrength.none => '',
    PasswordStrength.weak => 'Weak',
    PasswordStrength.medium => 'Medium',
    PasswordStrength.strong => 'Strong',
  };

  Color get color => switch (this) {
    PasswordStrength.none => Colors.grey,
    PasswordStrength.weak => Colors.red,
    PasswordStrength.medium => Colors.orange,
    PasswordStrength.strong => Colors.green,
  };

  String get emoji => switch (this) {
    PasswordStrength.none => '',
    PasswordStrength.weak => '🔴',
    PasswordStrength.medium => '🟠',
    PasswordStrength.strong => '🟢',
  };
}
