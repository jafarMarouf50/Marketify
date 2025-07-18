part of '../../index.dart';

class AddCategoryCubit extends Cubit<AddCategoryState> {
  final TextEditingController titleController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final ImageListManager imageManager = ImageListManager();

  AddCategoryCubit() : super(AddCategoryState.initial());

  void updateTitle(String value) {
    emit(state.copyWith(title: value));
  }

  void pickImage(File image) {
    emit(state.copyWith(image: image, isImagePicked: true));
  }

  void clearImage() {
    emit(state.copyWith(image: null, isImagePicked: false));
  }

  void dispose() {
    titleController.dispose();
  }
}
