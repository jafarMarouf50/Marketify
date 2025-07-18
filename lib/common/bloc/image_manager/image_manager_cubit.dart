part of '../../index.dart';

class ImageManagerCubit extends Cubit<ImageManagerState> {
  final ImagePickerService _pickerService;

  ImageManagerCubit(this._pickerService) : super(ImageManagerState.initial());

  void addImage(File image) {
    emit(state.copyWith(images: [...state.images, image]));
  }

  void addImages(List<File> images) {
    emit(state.copyWith(images: [...state.images, ...images]));
  }

  void removeImage(File image) {
    final updated = List<File>.from(state.images)..remove(image);
    emit(state.copyWith(images: updated));
  }

  void removeAt(int index) {
    final updated = List<File>.from(state.images)..removeAt(index);
    emit(state.copyWith(images: updated));
  }

  void clearImages() {
    emit(ImageManagerState.initial());
  }

  Future<void> pickImageFromGallery() async {
    emit(state.copyWith(isLoading: true));
    try {
      final file = await _pickerService.pickImageFromGallery();
      if (file != null) addImage(file);
      emit(state.copyWith(isLoading: false));
    } catch (e) {
      emit(state.copyWith(isLoading: false));

      debugPrint(e.toString());
    }
  }

  Future<void> pickImageFromCamera() async {
    emit(state.copyWith(isLoading: true));
    try {
      final file = await _pickerService.pickImageFromCamera();
      if (file != null) addImage(file);
      emit(state.copyWith(isLoading: false));
    } catch (e) {
      emit(state.copyWith(isLoading: false));

      debugPrint(e.toString());
    }
  }

  Future<void> pickMultipleImages() async {
    emit(state.copyWith(isLoading: true));
    try {
      final files = await _pickerService.pickMultipleImages();
      if (files.isNotEmpty) addImages(files);
      emit(state.copyWith(isLoading: false));
    } catch (e) {
      emit(state.copyWith(isLoading: false));

      debugPrint(e.toString());
    }
  }
}
