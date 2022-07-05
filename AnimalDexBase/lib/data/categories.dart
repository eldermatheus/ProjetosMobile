import 'package:pokedex/configs/colors.dart';
import 'package:pokedex/domain/entities/category.dart';
import 'package:pokedex/routes.dart';

const List<Category> categories = [
  Category(name: 'Animalia', color: AppColors.red, route: Routes.pokedex),
  Category(name: 'Plantae', color: AppColors.teal, route: Routes.pokedex),
  Category(name: 'Fungi', color: AppColors.lightYellow, route: Routes.pokedex),
  Category(name: 'Protoctista', color: AppColors.grey, route: Routes.pokedex),
  Category(name: 'Monera', color: AppColors.purple, route: Routes.pokedex)
];
