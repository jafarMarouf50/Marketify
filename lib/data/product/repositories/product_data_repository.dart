part of '../index.dart';

class ProductDataRepository {
  static List<ProductEntity> products() {
    return [
      // Nike Club Fleece Jacket
      ProductEntity(
        productId: 'jacket_001',
        title: 'Nike Club Fleece Hoodie Jacket',
        price: 79.99,
        discountedPrice: 56.97,
        imageUrl: [
          AppImages.imagesFleeceSkateHoodie,
          AppImages.imagesFleecePulloverHoodie,
          AppImages.imagesFleeceSkateHoodie,
        ],
        gender: 1,
        // Men
        categoryId: 'jackets_hoodies',
        colors: [
          ProductColorEntity(title: 'Navy Blue', hexColor: '#1E3A8A'),
          ProductColorEntity(title: 'Black', hexColor: '#000000'),
          ProductColorEntity(title: 'Gray', hexColor: '#6B7280'),
        ],
        sizes: ['S', 'M', 'L', 'XL', 'XXL'],
        rating: 4.5,
        salesNumber: '2.3K',
        createdDate: Timestamp.fromDate(DateTime(2024, 1, 15)),
      ),

      // Adidas Skate Jacket
      ProductEntity(
        productId: 'jacket_002',
        title: 'Adidas Originals Skateboarding Jacket',
        price: 150.97,
        discountedPrice: 150.97,
        imageUrl: [
          AppImages.imagesFleeceSkateHoodie,
          AppImages.imagesFleecePulloverHoodie,
          AppImages.imagesFleeceSkateHoodie,
        ],
        gender: 1,
        // Men
        categoryId: 'jackets_casual',
        colors: [
          ProductColorEntity(title: 'Cream', hexColor: '#F5F5DC'),
          ProductColorEntity(title: 'Olive Green', hexColor: '#556B2F'),
          ProductColorEntity(title: 'Brown', hexColor: '#8B4513'),
        ],
        sizes: ['S', 'M', 'L', 'XL'],
        rating: 4.2,
        salesNumber: '1.8K',
        createdDate: Timestamp.fromDate(DateTime(2024, 2, 20)),
      ),

      // Nike Therma-FIT Puffer Jacket
      ProductEntity(
        productId: 'jacket_003',
        title: 'Nike Therma-FIT Puffer Jacket',
        price: 320.00,
        discountedPrice: 280.97,
        imageUrl: [
          AppImages.imagesFleeceSkateHoodie,
          AppImages.imagesFleecePulloverHoodie,
          AppImages.imagesFleeceSkateHoodie,
        ],
        gender: 0,
        // Unisex
        categoryId: 'jackets_winter',
        colors: [
          ProductColorEntity(title: 'Black', hexColor: '#000000'),
          ProductColorEntity(title: 'Dark Gray', hexColor: '#2D3748'),
          ProductColorEntity(title: 'Navy', hexColor: '#1A202C'),
        ],
        sizes: ['XS', 'S', 'M', 'L', 'XL', 'XXL'],
        rating: 4.7,
        salesNumber: '3.1K',
        createdDate: Timestamp.fromDate(DateTime(2024, 3, 10)),
      ),

      // Carhartt Workwear Jacket
      ProductEntity(
        productId: 'jacket_004',
        title: 'Carhartt Men\'s Workwear Jacket',
        price: 159.99,
        discountedPrice: 128.97,
        imageUrl: [
          AppImages.imagesFleeceSkateHoodie,
          AppImages.imagesFleecePulloverHoodie,
          AppImages.imagesFleeceSkateHoodie,
        ],
        gender: 1,
        // Men
        categoryId: 'jackets_workwear',
        colors: [
          ProductColorEntity(title: 'Khaki', hexColor: '#C3B091'),
          ProductColorEntity(title: 'Dark Brown', hexColor: '#654321'),
          ProductColorEntity(title: 'Olive', hexColor: '#808000'),
        ],
        sizes: ['S', 'M', 'L', 'XL', 'XXL', 'XXXL'],
        rating: 4.6,
        salesNumber: '5.2K',
        createdDate: Timestamp.fromDate(DateTime(2024, 1, 5)),
      ),

      // Patagonia Outdoor Jacket
      ProductEntity(
        productId: 'jacket_005',
        title: 'Patagonia Houdini Windbreaker',
        price: 99.00,
        discountedPrice: 79.99,
        imageUrl: [
          AppImages.imagesFleeceSkateHoodie,
          AppImages.imagesFleecePulloverHoodie,
          AppImages.imagesFleeceSkateHoodie,
        ],
        gender: 0,
        // Unisex
        categoryId: 'jackets_outdoor',
        colors: [
          ProductColorEntity(title: 'Forest Green', hexColor: '#228B22'),
          ProductColorEntity(title: 'Bright Blue', hexColor: '#4169E1'),
          ProductColorEntity(title: 'Orange', hexColor: '#FF8C00'),
        ],
        sizes: ['XS', 'S', 'M', 'L', 'XL'],
        rating: 4.4,
        salesNumber: '1.2K',
        createdDate: Timestamp.fromDate(DateTime(2024, 4, 12)),
      ),

      // Champion Reverse Weave Hoodie
      ProductEntity(
        productId: 'jacket_006',
        title: 'Champion Reverse Weave Hoodie',
        price: 65.00,
        discountedPrice: 45.99,
        imageUrl: [
          AppImages.imagesFleeceSkateHoodie,
          AppImages.imagesFleecePulloverHoodie,
          AppImages.imagesFleeceSkateHoodie,
        ],
        gender: 0,
        // Unisex
        categoryId: 'jackets_hoodies',
        colors: [
          ProductColorEntity(title: 'Maroon', hexColor: '#800000'),
          ProductColorEntity(title: 'Navy', hexColor: '#000080'),
          ProductColorEntity(title: 'Gray', hexColor: '#808080'),
          ProductColorEntity(title: 'Black', hexColor: '#000000'),
        ],
        sizes: ['S', 'M', 'L', 'XL', 'XXL'],
        rating: 4.3,
        salesNumber: '4.7K',
        createdDate: Timestamp.fromDate(DateTime(2024, 2, 8)),
      ),

      // The North Face Denali Jacket
      ProductEntity(
        productId: 'jacket_007',
        title: 'The North Face Denali Fleece Jacket',
        price: 179.00,
        discountedPrice: 139.99,
        imageUrl: [
          AppImages.imagesFleeceSkateHoodie,
          AppImages.imagesFleecePulloverHoodie,
          AppImages.imagesFleeceSkateHoodie,
        ],
        gender: 1,
        // Men
        categoryId: 'jackets_fleece',
        colors: [
          ProductColorEntity(title: 'Black', hexColor: '#000000'),
          ProductColorEntity(title: 'Red', hexColor: '#DC143C'),
          ProductColorEntity(title: 'Blue', hexColor: '#0000FF'),
        ],
        sizes: ['S', 'M', 'L', 'XL', 'XXL'],
        rating: 4.8,
        salesNumber: '6.1K',
        createdDate: Timestamp.fromDate(DateTime(2024, 3, 25)),
      ),

      // Levi's Denim Jacket
      ProductEntity(
        productId: 'jacket_008',
        title: 'Levi\'s Classic Denim Trucker Jacket',
        price: 89.50,
        discountedPrice: 89.50,
        imageUrl: [
          AppImages.imagesFleeceSkateHoodie,
          AppImages.imagesFleecePulloverHoodie,
          AppImages.imagesFleeceSkateHoodie,
        ],
        gender: 0,
        // Unisex
        categoryId: 'jackets_denim',
        colors: [
          ProductColorEntity(title: 'Medium Blue', hexColor: '#4682B4'),
          ProductColorEntity(title: 'Dark Blue', hexColor: '#191970'),
          ProductColorEntity(title: 'Light Blue', hexColor: '#ADD8E6'),
        ],
        sizes: ['XS', 'S', 'M', 'L', 'XL', 'XXL'],
        rating: 4.4,
        salesNumber: '8.9K',
        createdDate: Timestamp.fromDate(DateTime(2024, 1, 30)),
      ),

      // Columbia Rain Jacket
      ProductEntity(
        productId: 'jacket_009',
        title: 'Columbia Watertight II Rain Jacket',
        price: 55.00,
        discountedPrice: 39.99,
        imageUrl: [
          AppImages.imagesFleeceSkateHoodie,
          AppImages.imagesFleecePulloverHoodie,
          AppImages.imagesFleeceSkateHoodie,
        ],
        gender: 1,
        // Men
        categoryId: 'jackets_rain',
        colors: [
          ProductColorEntity(title: 'Black', hexColor: '#000000'),
          ProductColorEntity(title: 'Navy', hexColor: '#000080'),
          ProductColorEntity(title: 'Red', hexColor: '#FF0000'),
        ],
        sizes: ['S', 'M', 'L', 'XL', 'XXL'],
        rating: 4.1,
        salesNumber: '2.8K',
        createdDate: Timestamp.fromDate(DateTime(2024, 4, 5)),
      ),

      // Zara Blazer
      ProductEntity(
        productId: 'jacket_010',
        title: 'Zara Slim Fit Blazer',
        price: 129.00,
        discountedPrice: 99.99,
        imageUrl: [
          AppImages.imagesFleeceSkateHoodie,
          AppImages.imagesFleecePulloverHoodie,
          AppImages.imagesFleeceSkateHoodie,
        ],
        gender: 1,
        // Men
        categoryId: 'jackets_blazer',
        colors: [
          ProductColorEntity(title: 'Charcoal', hexColor: '#36454F'),
          ProductColorEntity(title: 'Navy', hexColor: '#000080'),
          ProductColorEntity(title: 'Black', hexColor: '#000000'),
        ],
        sizes: ['S', 'M', 'L', 'XL'],
        rating: 4.0,
        salesNumber: '1.5K',
        createdDate: Timestamp.fromDate(DateTime(2024, 3, 18)),
      ),

      // H&M Bomber Jacket
      ProductEntity(
        productId: 'jacket_011',
        title: 'H&M Bomber Jacket',
        price: 49.99,
        discountedPrice: 34.99,
        imageUrl: [
          AppImages.imagesFleeceSkateHoodie,
          AppImages.imagesFleecePulloverHoodie,
          AppImages.imagesFleeceSkateHoodie,
        ],
        gender: 0,
        // Unisex
        categoryId: 'jackets_bomber',
        colors: [
          ProductColorEntity(title: 'Olive Green', hexColor: '#556B2F'),
          ProductColorEntity(title: 'Black', hexColor: '#000000'),
          ProductColorEntity(title: 'Navy', hexColor: '#000080'),
        ],
        sizes: ['XS', 'S', 'M', 'L', 'XL'],
        rating: 3.8,
        salesNumber: '7.2K',
        createdDate: Timestamp.fromDate(DateTime(2024, 2, 14)),
      ),

      // Under Armour Track Jacket
      ProductEntity(
        productId: 'jacket_012',
        title: 'Under Armour Track Jacket',
        price: 75.00,
        discountedPrice: 59.99,
        imageUrl: [
          AppImages.imagesFleeceSkateHoodie,
          AppImages.imagesFleecePulloverHoodie,
          AppImages.imagesFleeceSkateHoodie,
        ],
        gender: 1,
        // Men
        categoryId: 'jackets_athletic',
        colors: [
          ProductColorEntity(title: 'Black', hexColor: '#000000'),
          ProductColorEntity(title: 'Gray', hexColor: '#808080'),
          ProductColorEntity(title: 'Red', hexColor: '#FF0000'),
        ],
        sizes: ['S', 'M', 'L', 'XL', 'XXL'],
        rating: 4.2,
        salesNumber: '3.4K',
        createdDate: Timestamp.fromDate(DateTime(2024, 4, 20)),
      ),
    ];
  }
}
