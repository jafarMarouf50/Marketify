part of '../../index.dart';

class AppBottomSheet {
  static Future<void> display(BuildContext context, Widget widget) async {
    return await showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      builder: (_) {
        return widget;
      },
    );
  }
}
