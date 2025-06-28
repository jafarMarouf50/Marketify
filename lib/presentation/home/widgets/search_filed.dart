part of '../index.dart';

class SearchFiled extends StatelessWidget {
  const SearchFiled({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      readOnly: true,
      onTap: () {
        //   navigate to search pages
      },
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(12),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        prefixIcon: SvgPicture.asset(AppImages.vectorsSearch, fit: BoxFit.none),
        hintText: 'search',
      ),
    );
  }
}
