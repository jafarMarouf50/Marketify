part of '../index.dart';

class CategoryDataRepository {
  static List<CategoryEntity> categories() {
    return [
      CategoryEntity(title: 'Hoodies', image: AppImages.imagesHoodies),
      CategoryEntity(title: 'Jackets', image: AppImages.imagesHoodies),
      CategoryEntity(title: 'T-Shirts', image: AppImages.imagesHoodies),
      CategoryEntity(title: 'Pants', image: AppImages.imagesHoodies),
      CategoryEntity(title: 'Hats', image: AppImages.imagesHoodies),
      CategoryEntity(title: 'Accessories', image: AppImages.imagesHoodies),
    ];
  }
}
