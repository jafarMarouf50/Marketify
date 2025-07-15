part of '../index.dart';

class CustomTextField extends StatelessWidget {
  final String title;
  final TextEditingController controller;
  final String? errorText;
  final bool obscureText;
  final Widget? suffixIcon;
  final TextInputAction? textInputAction;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;

  const CustomTextField({
    super.key,
    required this.title,
    required this.controller,
    this.errorText,
    this.obscureText = false,
    this.suffixIcon,
    this.textInputAction,
    this.onChanged,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      textInputAction: textInputAction ?? TextInputAction.next,
      onChanged: onChanged,
      validator: validator,
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
