part of '../index.dart';

class AddCategoryScreen extends StatefulWidget {
  const AddCategoryScreen({super.key});

  @override
  State<AddCategoryScreen> createState() => _AddCategoryScreenState();
}

class _AddCategoryScreenState extends State<AddCategoryScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  bool _isLoading = false;

  Future<void> _saveCategory() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      await Future.delayed(const Duration(seconds: 2));

      setState(() {
        _isLoading = false;
      });

      // Show success message
      AppSnackBar.show(
        Text('Category "${_titleController.text}" created successfully!'),
      );
      // Navigate back
      Navigator.pop(context);
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(
        title: Text(
          'Add Category',
          style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildHeaderCategory(),
              SizedBox(height: 32),

              TextFormFieldTitle(title: "Title Category"),
              const SizedBox(height: 12),
              CustomTextFormField(
                controller: _titleController,
                hintText: "Enter category title",
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter a category title';
                  }
                  if (value.trim().length < 2) {
                    return 'Title must be at least 2 characters long';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),

              // Image Upload Section
              TextFormFieldTitle(title: 'Category Image'),
              const SizedBox(height: 12),
              PickImageSection(),

              SizedBox(height: 40),

              BasicAppButton(
                title: "Create Category",
                onPressed: _isLoading ? null : _saveCategory,
                backgroundColor: const Color(0xFF10B981),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeaderCategory() {
    return Container(
      padding: EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFF1E293B),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              // color: AppColorsDark.primary,
              color: const Color(0xFF334155),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              Icons.category_outlined,
              size: 48,
              color: AppColorsDark.text,
            ),
          ),
          SizedBox(height: 16),
          Text(
            'Create New Category',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColorsDark.text,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Add a title and image for your category',
            style: TextStyle(fontSize: 14, color: AppColorsDark.hintText),
          ),
        ],
      ),
    );
  }
}
