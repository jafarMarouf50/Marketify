part of '../index.dart';

class AddProductView extends StatefulWidget {
  const AddProductView({super.key});

  @override
  State<AddProductView> createState() => _AddProductViewState();
}

class _AddProductViewState extends State<AddProductView> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _priceController = TextEditingController();
  final _stockController = TextEditingController();

  final _sizesController = TextEditingController();
  final _colorsController = TextEditingController();
  final _discountController = TextEditingController();

  String? _selectedCategory;
  bool _isLoading = false;
  bool _hasDiscount = false;

  final List<String> _categories = [
    'Electronics',
    'Clothing',
    'Books',
    'Home & Garden',
    'Sports',
    'Beauty',
    'Toys',
    'Food',
  ];

  Future<void> _saveProduct() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      await Future.delayed(const Duration(seconds: 2));

      setState(() {
        _isLoading = false;
      });

      AppSnackBar.show(
        Text('Product "${_nameController.text}" created successfully!'),
      );
      // Navigate back
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _priceController.dispose();
    _stockController.dispose();

    _sizesController.dispose();
    _colorsController.dispose();
    _discountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(
        title: Text(
          'Add Product',
          style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white),
        ),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Product Images
              TextFormFieldTitle(title: 'Product Images'),
              const SizedBox(height: 12),
              PickImageSection(),
              const SizedBox(height: 24),

              // Product Name
              TextFormFieldTitle(title: 'Product Name'),
              const SizedBox(height: 8),
              CustomTextFormField(
                controller: _nameController,
                hintText: 'Enter product name',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a product name';
                  }
                  if (value.trim().length < 2) {
                    return 'Title must be at least 2 characters long';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),

              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFormFieldTitle(title: 'Price (\$)'),
                        const SizedBox(height: 8),
                        CustomTextFormField(
                          controller: _priceController,
                          hintText: '0.00',
                          keyboardType: TextInputType.numberWithOptions(
                            decimal: true,
                          ),
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                              RegExp(r'^\d*\.?\d{0,2}'),
                            ),
                          ],
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Enter price';
                            }
                            if (double.tryParse(value) == null) {
                              return 'Invalid price';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFormFieldTitle(title: 'Stock Quantity'),
                        const SizedBox(height: 8),
                        CustomTextFormField(
                          controller: _stockController,
                          hintText: '0',
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Enter stock';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // Sizes
              TextFormFieldTitle(title: 'Available Sizes'),
              const SizedBox(height: 8),
              CustomTextFormField(
                controller: _sizesController,
                hintText: 'e.g., S, M, L, XL or 38, 40, 42',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter available sizes';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),

              // Colors
              TextFormFieldTitle(title: 'Available Colors'),
              const SizedBox(height: 8),
              CustomTextFormField(
                controller: _colorsController,
                hintText: 'e.g., Red, Blue, Green, Black',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter available colors';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),

              TextFormFieldTitle(title: 'Category'),
              const SizedBox(height: 8),
              _buildDropdown(
                value: _selectedCategory,
                items: _categories,
                hintText: 'Select category',
                onChanged: (value) {
                  setState(() {
                    _selectedCategory = value;
                  });
                },
                validator: (value) {
                  if (value == null) {
                    return 'Please select a category';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),
              // Discount Section
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFF1E293B),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Discount Available',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Add discount to this product',
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                        Checkbox(
                          value: _hasDiscount,
                          onChanged: (value) {
                            setState(() {
                              _hasDiscount = value ?? false;
                              if (!_hasDiscount) {
                                _discountController.clear();
                              }
                            });
                          },
                          activeColor: const Color(0xFF10B981),
                          checkColor: Colors.white,
                        ),
                      ],
                    ),
                    if (_hasDiscount) ...[
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Discount Percentage (%)',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                CustomTextFormField(
                                  controller: _discountController,
                                  hintText: '0',
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(
                                      RegExp(r'^\d{0,2}'),
                                    ),
                                  ],
                                  validator: _hasDiscount
                                      ? (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Enter discount %';
                                          }
                                          final discount = int.tryParse(value);
                                          if (discount == null ||
                                              discount < 1 ||
                                              discount > 99) {
                                            return 'Enter valid % (1-99)';
                                          }
                                          return null;
                                        }
                                      : null,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Final Price (\$)',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Container(
                                  padding: const EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF374151),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Text(
                                    _calculateFinalPrice(),
                                    style: TextStyle(
                                      color: const Color(0xFF10B981),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ],
                ),
              ),

              const SizedBox(height: 32),

              // Save Button
              BasicAppButton(
                title: "Create Product",
                onPressed: _isLoading ? null : _saveProduct,
                backgroundColor: const Color(0xFF10B981),
              ),

              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  String _calculateFinalPrice() {
    final priceText = _priceController.text;
    final discountText = _discountController.text;

    if (priceText.isEmpty || !_hasDiscount || discountText.isEmpty) {
      return priceText.isEmpty ? '0.00' : priceText;
    }

    final price = double.tryParse(priceText) ?? 0.0;
    final discount = int.tryParse(discountText) ?? 0;

    final finalPrice = price - (price * discount / 100);
    return finalPrice.toStringAsFixed(2);
  }

  Widget _buildDropdown({
    required String? value,
    required List<String> items,
    required String hintText,
    required void Function(String?) onChanged,
    String? Function(String?)? validator,
  }) {
    return DropdownButtonFormField<String>(
      value: value,
      items: items.map((String item) {
        return DropdownMenuItem<String>(
          value: item,
          child: Text(item, style: const TextStyle(color: Colors.white)),
        );
      }).toList(),
      onChanged: onChanged,
      validator: validator,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.white54),
        filled: true,
        fillColor: const Color(0xFF1E293B),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFF10B981), width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFFEF4444), width: 2),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFFEF4444), width: 2),
        ),
        contentPadding: const EdgeInsets.all(16),
      ),
      dropdownColor: const Color(0xFF1E293B),
      icon: const Icon(Icons.keyboard_arrow_down, color: Colors.white70),
    );
  }
}
