import 'package:project_akhir/model/list_menu.dart';

class Category {
  String name;
  String imageAsset;
  List<ResepMenu> list;

  Category({
    required this.name,
    required this.imageAsset,
    required this.list,
  });
}

var categoryList = [
  Category(
    name: 'Main Food',
    imageAsset: 'images/icon/icon1.png',
    list: resepMainFood,
  ),
  Category(
    name: 'Noodle',
    imageAsset: 'images/icon/icon2.png',
    list: resepNoodle,
  ),
  Category(
    name: 'Drink',
    imageAsset: 'images/icon/icon3.png',
    list: resepDrink,
  ),
  Category(
    name: 'Dessert',
    imageAsset: 'images/icon/icon4.png',
    list: resepDessert,
  ),
  Category(
    name: 'Cake',
    imageAsset: 'images/icon/icon5.png',
    list: resepCake,
  ),
];
