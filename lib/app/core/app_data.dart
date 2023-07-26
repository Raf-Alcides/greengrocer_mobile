import 'package:greengrocer_mobile/app/models/item_model.dart';

final ItemModel apple = ItemModel(
  itemName: 'Maça',
  imgUrl: 'assets/images/apple.png',
  unit: 'kilo',
  price: 4.43,
  description: 'A Maçã Fuji Possui fibras solúveis que ajudam a reduzir o colesterol sangüíneo.  A Maçã Gala é fonte de ferro, mineral essencial para a formação dos glóbulos vermelhos. A Maçã Golden possui enzimas que melhoram a digestão. Vendida por quilo (KG) e unidade (UN). Variações da Maçã: Golden, Red Delicious, Nacional Fuji e Nacional Gala.',
);

final ItemModel grape = ItemModel(
  itemName: 'Uva',
  imgUrl: 'assets/images/grape.png',
  unit: 'kilo',
  price: 7.5,
  description: 'A melhor Uva do mundo',
);

final ItemModel guava = ItemModel(
  itemName: 'Goiaba',
  imgUrl: 'assets/images/guava.png',
  unit: 'kilo',
  price: 1.5,
  description: 'A melhor Goiaba do mundo',
);

final ItemModel kiwi = ItemModel(
  itemName: 'Kiwi',
  imgUrl: 'assets/images/kiwi.png',
  unit: 'Unidade',
  price: 1,
  description: 'O melhor Kiwi do mundo',
);

final ItemModel mango = ItemModel(
  itemName: 'Manga',
  imgUrl: 'assets/images/mango.png',
  unit: 'Unidade',
  price: 2.5,
  description: 'A melhor Manga do mundo',
);

final ItemModel mamao = ItemModel(
  itemName: 'Mamão',
  imgUrl: 'assets/images/papaya.png',
  unit: 'Unidade',
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