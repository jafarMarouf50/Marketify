part of '../../index.dart';

class ImagePickerService {
  static final ImagePickerService _instance = ImagePickerService._internal();

  factory ImagePickerService() => _instance;

  ImagePickerService._internal();

  final ImagePicker _picker = ImagePicker();

  Future<File?> pickImageFromGallery({
    double? maxWidth = 1920,
    double? maxHeight = 1080,
    int? imageQuality = 85,
  }) async {
    try {
      final XFile? image = await _picker.pickImage(
        source: ImageSource.gallery,
        maxWidth: maxWidth,
        maxHeight: maxHeight,
        imageQuality: imageQuality,
      );

      if (image != null) {
        return File(image.path);
      }
      return null;
    } catch (e) {
      throw ImagePickerException('Error picking image from gallery: $e');
    }
  }

  Future<File?> pickImageFromCamera({
    double? maxWidth = 1920,
    double? maxHeight = 1080,
    int? imageQuality = 85,
  }) async {
    try {
      final XFile? image = await _picker.pickImage(
        source: ImageSource.camera,
        maxWidth: maxWidth,
        maxHeight: maxHeight,
        imageQuality: imageQuality,
      );

      if (image != null) {
        return File(image.path);
      }
      return null;
    } catch (e) {
      throw ImagePickerException('Error taking photo: $e');
    }
  }

  /// Pick multiple images from gallery
  Future<List<File>> pickMultipleImages({
    double? maxWidth = 1920,
    double? maxHeight = 1080,
    int? imageQuality = 85,
  }) async {
    try {
      final List<XFile> images = await _picker.pickMultiImage(
        maxWidth: maxWidth,
        maxHeight: maxHeight,
        imageQuality: imageQuality,
      );

      return images.map((image) => File(image.path)).toList();
    } catch (e) {
      throw ImagePickerException('Error picking multiple images: $e');
    }
  }
}

class ImageListManager {
  final List<File> _images = [];
  final void Function()? onImagesChanged;

  ImageListManager({this.onImagesChanged});

  List<File> get images => List.unmodifiable(_images);

  bool get isEmpty => _images.isEmpty;

  bool get isNotEmpty => _images.isNotEmpty;

  int get length => _images.length;

  /// Add a single image
  void addImage(File image) {
    _images.add(image);
    onImagesChanged?.call();
  }

  /// Add multiple images
  void addImages(List<File> images) {
    _images.addAll(images);
    onImagesChanged?.call();
  }

  /// Remove image at specific index
  void removeImageAt(int index) {
    if (index >= 0 && index < _images.length) {
      _images.removeAt(index);
      onImagesChanged?.call();
    }
  }

  /// Remove specific image
  void removeImage(File image) {
    _images.remove(image);
    onImagesChanged?.call();
  }

  /// Clear all images
  void clearImages() {
    _images.clear();
    onImagesChanged?.call();
  }

  /// Replace image at specific index
  void replaceImageAt(int index, File newImage) {
    if (index >= 0 && index < _images.length) {
      _images[index] = newImage;
      onImagesChanged?.call();
    }
  }
}

class ImagePickerException implements Exception {
  final String message;

  ImagePickerException(this.message);

  @override
  String toString() => 'ImagePickerException: $message';
}
