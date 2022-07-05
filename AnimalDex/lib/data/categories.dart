import 'package:animaldex/configs/colors.dart';
import 'package:animaldex/domain/entities/category.dart';
import 'package:animaldex/routes.dart';

const List<Category> categories = [
  Category(name: 'Animalia', color: AppColors.red, route: Routes.animaldex),
  Category(name: 'Plantae', color: AppColors.teal, route: Routes.animaldex),
  Category(name: 'Fungi', color: AppColors.lightYellow, route: Routes.animaldex),
  Category(name: 'Protoctista', color: AppColors.grey, route: Routes.animaldex),
  Category(name: 'Monera', color: AppColors.purple, route: Routes.animaldex)
];
