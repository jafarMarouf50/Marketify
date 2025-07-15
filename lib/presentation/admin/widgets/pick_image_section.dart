part of '../index.dart';

class PickImageSection extends StatefulWidget {
  const PickImageSection({super.key});

  @override
  State<PickImageSection> createState() => _PickImageSectionState();
}

class _PickImageSectionState extends State<PickImageSection> {
  final ImagePickerService _imagePickerService = ImagePickerService();
  late final ImageListManager _imageManager;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _imageManager = ImageListManager(
      onImagesChanged: () {
        setState(() {});
      },
    );
  }

  Future<void> _pickImageFromGallery() async {
    try {
      setState(() {
        _isLoading = true;
      });

      final File? image = await _imagePickerService.pickImageFromGallery();

      if (image != null) {
        _imageManager.addImage(image);
      }
    } on ImagePickerException catch (e) {
      showErrorDialog(context, e.message);
    } catch (e) {
      showErrorDialog(context, 'Unexpected error: $e');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _pickImageFromCamera() async {
    try {
      setState(() {
        _isLoading = true;
      });

      final File? image = await _imagePickerService.pickImageFromCamera();

      if (image != null) {
        _imageManager.addImage(image);
      }
    } on ImagePickerException catch (e) {
      showErrorDialog(context, e.message);
    } catch (e) {
      showErrorDialog(context, 'Unexpected error: $e');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _pickMultipleImages() async {
    try {
      setState(() {
        _isLoading = true;
      });

      final List<File> images = await _imagePickerService.pickMultipleImages();

      if (images.isNotEmpty) {
        _imageManager.addImages(images);
      }
    } on ImagePickerException catch (e) {
      showErrorDialog(context, e.message);
    } catch (e) {
      showErrorDialog(context, 'Unexpected error: $e');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1E293B),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          // Add Image Button
          GestureDetector(
            onTap: _isLoading ? null : _showImageSourceDialog,
            child: Container(
              height: 120,
              decoration: BoxDecoration(
                color: const Color(0xFF334155),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: const Color(0xFF64748B),
                  style: BorderStyle.solid,
                  width: 2,
                ),
              ),
              child: Center(
                child: _isLoading
                    ? const CircularProgressIndicator(color: Colors.white70)
                    : const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.add_photo_alternate,
                            color: Colors.white70,
                            size: 40,
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Add Images',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
              ),
            ),
          ),

          // Selected Images
          if (_imageManager.isNotEmpty) ...[
            const SizedBox(height: 16),
            SizedBox(
              height: 80,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _imageManager.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: 80,
                    height: 80,
                    margin: const EdgeInsets.only(right: 12),
                    decoration: BoxDecoration(
                      color: const Color(0xFF334155),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.file(
                            _imageManager.images[index],
                            width: 80,
                            height: 80,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          top: 4,
                          right: 4,
                          child: GestureDetector(
                            onTap: () => _imageManager.removeImageAt(index),
                            child: Container(
                              width: 20,
                              height: 20,
                              decoration: const BoxDecoration(
                                color: Color(0xFFEF4444),
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.close,
                                color: Colors.white,
                                size: 12,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ],
      ),
    );
  }

  void _showImageSourceDialog() {
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
                  _pickImageFromGallery();
                },
              ),
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text('Camera'),
                onTap: () {
                  Navigator.of(context).pop();
                  _pickImageFromCamera();
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_library_outlined),
                title: const Text('Multiple Images'),
                onTap: () {
                  Navigator.of(context).pop();
                  _pickMultipleImages();
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
