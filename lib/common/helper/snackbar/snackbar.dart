part of '../../index.dart';

class AppSnackBar {
  static SnackBar show(Widget widget, {Color? backgroundColor}) {
    return SnackBar(
      content: widget,
      behavior: SnackBarBehavior.floating,
      elevation: 0,
      duration: Duration(seconds: 3),
      backgroundColor: backgroundColor ?? Colors.grey,
    );
  }
}
