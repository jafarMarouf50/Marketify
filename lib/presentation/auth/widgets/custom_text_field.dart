part of '../index.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.title,
    required this.controller,
    this.errorText,
    this.obscureText = false,
    this.suffixIcon,
    this.textInputAction,
  });

  final String title;
  final TextEditingController controller;
  final String? errorText;
  final bool obscureText;
  final Widget? suffixIcon;
  final TextInputAction? textInputAction;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      textInputAction: textInputAction ?? TextInputAction.next,
      decoration: InputDecoration(
        hintText: title,
        errorText: errorText,
        errorStyle: const TextStyle(color: Colors.red, fontSize: 12.0),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 1.0),
        ),
        suffixIcon: suffixIcon,
      ),
    );
  }
}
