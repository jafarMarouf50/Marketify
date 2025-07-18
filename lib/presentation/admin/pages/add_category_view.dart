part of '../index.dart';

class AddCategoryView extends StatelessWidget {
  const AddCategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(
        title: Text(
          'Add Category',
          style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white),
        ),
      ),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => ButtonCubit()),
          BlocProvider(create: (_) => AddCategoryCubit()),
          BlocProvider(create: (_) => ImageManagerCubit(ImagePickerService())),
        ],
        child: AddCategoryBody(),
      ),
    );
  }
}
