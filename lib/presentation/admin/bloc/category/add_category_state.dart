part of '../../index.dart';

class AddCategoryState {
  final String title;
  final File? image;
  final bool isImagePicked;

  AddCategoryState({
    required this.title,
    required this.image,
    required this.isImagePicked,
  });

  AddCategoryState copyWith({String? title, File? image, bool? isImagePicked}) {
    return AddCategoryState(
      title: title ?? this.title,
      image: image ?? this.image,
      isImagePicked: isImagePicked ?? this.isImagePicked,
    );
  }

  factory AddCategoryState.initial() => AddCategoryState(
    title: '',
    image: null,
    isImagePicked: false,
  );
}
