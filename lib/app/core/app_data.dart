import 'package:greengrocer_mobile/app/models/item_model.dart';

final ItemModel apple = ItemModel(
  itemName: 'Maça',
  imgUrl: 'assets/images/apple.png',
  unit: 'kg',
  price: 4.43,
  description: 'A melhor maça do mundo',
);

final ItemModel grape = ItemModel(
  itemName: 'Uva',
  imgUrl: 'assets/images/grape.png',
  unit: 'kg',
  price: 7.5,
  description: 'A melhor Uva do mundo',
);

final ItemModel guava = ItemModel(
  itemName: 'Goiaba',
  imgUrl: 'assets/images/guava.png',
  unit: 'kg',
  price: 1.5,
  description: 'A melhor Goiaba do mundo',
);

final ItemModel kiwi = ItemModel(
  itemName: 'Kiwi',
  imgUrl: 'assets/images/kiwi.png',
  unit: 'Un',
  price: 1,
  description: 'O melhor Kiwi do mundo',
);

final ItemModel mango = ItemModel(
  itemName: 'Manga',
  imgUrl: 'assets/images/mango.png',
  unit: 'kg',
  price: 2.5,
  description: 'A melhor Manga do mundo',
);

final ItemModel mamao = ItemModel(
  itemName: 'Mamão Papaya',
  imgUrl: 'assets/images/papaya.png',
  unit: 'Un',
  price: 3,
  description: 'O melhor Mamão do mundo',
);

List<ItemModel> items = [
  apple,
  grape,
  guava,
  kiwi,
  mango,
  mamao,
];

List<String> categories = [
    'Frutas',
    'Verduras',
    'Legumes',
    'Hortalizas',
    'Temperos',
  ];