class ShoesModel {
  int? id;
  String? imageStr;
  String? name;
  double? price;
  int? quantity;
  String? description;

  double get total => (price ?? 0.0) * (quantity ?? 0);
}

List<ShoesModel> shoes = [
  ShoesModel()
    ..id = 1
    ..imageStr = 'assets/images/i1.png'
    ..name = 'Nike Jordan'
    ..price = 300
    ..quantity = 1
    ..description = 'Golden browse fried chicken',
  ShoesModel()
    ..id = 2
    ..imageStr = 'assets/images/i2.png'
    ..name = 'Nike Air Max'
    ..price = 300
    ..quantity = 1
    ..description = 'Golden browse fried chicken',
  ShoesModel()
    ..id = 3
    ..imageStr = 'assets/images/i3.png'
    ..name = 'Nike Air Jordan'
    ..price = 300
    ..quantity = 2
    ..description = 'Golden browse fried chicken',
      ShoesModel()
    ..id = 4
    ..imageStr = 'assets/images/i4.png'
    ..name = 'Nike Jordan'
    ..price = 300
    ..quantity = 2
    ..description = 'Golden browse fried chicken',
      ShoesModel()
    ..id = 5
    ..imageStr = 'assets/images/i5.jpg'
    ..name = 'Nike Jordan'
    ..price = 300
    ..quantity = 2
    ..description = 'Golden browse fried chicken',

];
