part of '../index.dart';

class SearchFiled extends StatelessWidget {
  const SearchFiled({super.key, this.onTap, this.isReadOnly = true});

  final void Function()? onTap;
  final bool isReadOnly;

  @override
  Widget build(BuildContext context) {
    return TextField(
      readOnly: isReadOnly,
      onTap: onTap,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(12),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        prefixIcon: SvgPicture.asset(AppImages.vectorsSearch, fit: BoxFit.none),
        suffixIcon: !isReadOnly
            ? IconButton(onPressed: () {}, icon: Icon(Icons.clear))
            : null,
        hintText: 'search',
      ),
    );
  }
}
