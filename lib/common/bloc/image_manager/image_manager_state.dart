part of '../../index.dart';

@immutable
class ImageManagerState {
  final List<File> images;
  final bool isLoading;

  const ImageManagerState({required this.images, required this.isLoading});

  factory ImageManagerState.initial() =>
      const ImageManagerState(images: [], isLoading: false);

  ImageManagerState copyWith({List<File>? images, bool? isLoading}) {
    return ImageManagerState(
      images: images ?? this.images,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  bool get isEmpty => images.isEmpty;

  bool get isNotEmpty => images.isNotEmpty;
}
