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
        imageUrls: [
          AppImages.imagesFleeceSkateHoodie,
          AppImages.imagesFleecePulloverHoodie,
          AppImages.imagesFleeceSkateHoodie,
          AppImages.imagesFleecePulloverHoodie,
          AppImages.imagesFleeceSkateHoodie,
          AppImages.imagesFleecePulloverHoodie,
          AppImages.imagesFleeceSkateHoodie,
        ],
        gender: 1,
        // Men
        categoryId: 'jackets_hoodies',
        colors: [
          ProductColorEntity(title: 'Red', rgb: [255, 0, 0]),
          ProductColorEntity(title: 'Black', rgb: [0, 0, 0]),
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
        imageUrls: [
          AppImages.imagesFleeceSkateHoodie,
          AppImages.imagesFleecePulloverHoodie,
          AppImages.imagesFleeceSkateHoodie,
          AppImages.imagesFleecePulloverHoodie,
          AppImages.imagesFleeceSkateHoodie,
          AppImages.imagesFleecePulloverHoodie,
          AppImages.imagesFleeceSkateHoodie,
        ],
        gender: 1,
        // Men
        categoryId: 'jackets_casual',
        colors: [
          ProductColorEntity(title: 'White', rgb: [255, 255, 255]),
          ProductColorEntity(title: 'Blue', rgb: [0, 0, 255]),
          ProductColorEntity(title: 'Black', rgb: [0, 0, 0]),
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
        imageUrls: [
          AppImages.imagesFleeceSkateHoodie,
          AppImages.imagesFleecePulloverHoodie,
          AppImages.imagesFleeceSkateHoodie,
          AppImages.imagesFleecePulloverHoodie,
          AppImages.imagesFleeceSkateHoodie,
          AppImages.imagesFleecePulloverHoodie,
          AppImages.imagesFleeceSkateHoodie,
        ],
        gender: 0,
        // Unisex
        categoryId: 'jackets_winter',
        colors: [
          ProductColorEntity(title: 'White', rgb: [255, 255, 255]),
          ProductColorEntity(title: 'Blue', rgb: [0, 0, 255]),
          ProductColorEntity(title: 'Black', rgb: [0, 0, 0]),
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
        imageUrls: [
          AppImages.imagesFleeceSkateHoodie,
          AppImages.imagesFleecePulloverHoodie,
          AppImages.imagesFleeceSkateHoodie,
          AppImages.imagesFleecePulloverHoodie,
          AppImages.imagesFleeceSkateHoodie,
          AppImages.imagesFleecePulloverHoodie,
          AppImages.imagesFleeceSkateHoodie,
        ],
        gender: 1,
        // Men
        categoryId: 'jackets_workwear',
        colors: [
          ProductColorEntity(title: 'Red', rgb: [255, 0, 0]),
          ProductColorEntity(title: 'Black', rgb: [0, 0, 0]),
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
        imageUrls: [
          AppImages.imagesFleeceSkateHoodie,
          AppImages.imagesFleecePulloverHoodie,
          AppImages.imagesFleeceSkateHoodie,
          AppImages.imagesFleecePulloverHoodie,
          AppImages.imagesFleeceSkateHoodie,
          AppImages.imagesFleecePulloverHoodie,
          AppImages.imagesFleeceSkateHoodie,
        ],
        gender: 0,
        // Unisex
        categoryId: 'jackets_outdoor',
        colors: [
          ProductColorEntity(title: 'Red', rgb: [255, 0, 0]),
          ProductColorEntity(title: 'Black', rgb: [0, 0, 0]),
        ],
        sizes: ['XS', 'S', 'M', 'L', 'XL'],
        rating: 4.4,
        salesNumber: '1.2K',
        createdDate: Timestamp.fromDate(DateTime(2024, 4, 12)),
      ),
    ];
  }
}
