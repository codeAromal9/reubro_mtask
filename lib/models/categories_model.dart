import 'dart:ui';

class CategoriesModel {

  final List _categoriesItems = [
    // title, image, container color
    ["LEVELS", "assets/icons/choices 1.png", Color(0xFF75BAF1), ],
    ["REWARD", "assets/icons/trophy 1.png", Color(0xFFF35453)],
    ["INDIAN ECONOMIC", "assets/icons/money-bag 1.png", Color(0xFFB375F7)],
    ["MICRO ECO", "assets/icons/profits 1.png", Color(0xFFFDBE6C)],
  ];

  get categoriesItems => _categoriesItems;
}