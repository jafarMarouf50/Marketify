part of '../index.dart';

void showImageSourceDialog(BuildContext context) {
  final cubit = context.read<ImageManagerCubit>();
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Select Image Source'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: const Text('Gallery'),
              onTap: () {
                Navigator.of(context).pop();
                cubit.pickImageFromGallery();
              },
            ),
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: const Text('Camera'),
              onTap: () {
                Navigator.of(context).pop();
                // cubit.updateLoading();
                cubit.pickImageFromCamera();
                // cubit.updateLoading();
              },
            ),
            ListTile(
              leading: const Icon(Icons.photo_library_outlined),
              title: const Text('Multiple Images'),
              onTap: () {
                Navigator.of(context).pop();
                cubit.pickMultipleImages();
              },
            ),
          ],
        ),
      );
    },
  );
}
