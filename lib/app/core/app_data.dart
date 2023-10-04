import 'package:greengrocer_mobile/app/models/item_model.dart';
import 'package:greengrocer_mobile/app/models/order_model.dart';
import 'package:greengrocer_mobile/app/models/user_model.dart';

import '../models/cart_item_model.dart';

final ItemModel apple = ItemModel(
  itemName: 'Maça',
  imgUrl: 'assets/images/apple.png',
  unit: 'kilo',
  price: 4.43,
  description:
      'A Maçã Fuji Possui fibras solúveis que ajudam a reduzir o colesterol sangüíneo.  A Maçã Gala é fonte de ferro, mineral essencial para a formação dos glóbulos vermelhos. A Maçã Golden possui enzimas que melhoram a digestão. Vendida por quilo (KG) e unidade (UN). Variações da Maçã: Golden, Red Delicious, Nacional Fuji e Nacional Gala.',
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

List<CartItemModel> cartItem = [
  CartItemModel(item: apple, quantity: 3),
  CartItemModel(item: mamao, quantity: 2),
  CartItemModel(item: mango, quantity: 1),
];

UserModel user = UserModel(
  nome: 'Rafael',
  email: 'Rafael@email.com',
  telefone: '71 9 8101-0276',
  password: '',
  cpf: '076.708.835-29',
);

List<OrderModel> orders = [
  OrderModel(
    id: '000001',
    createDateTime: DateTime.parse('2023-08-01 13:32:00.000'),
    overdueDateTime: DateTime.parse('2024-08-01 13:37:00.000'),
    items: [
      CartItemModel(
        item: guava,
        quantity: 3,
      ),
      CartItemModel(
        item: kiwi,
        quantity: 2,
      )
    ],
    status: 'pending_payment',
    copyAndPast: 'codigopixqualquer',
    total: 6.5,
  ),

  OrderModel(
    id: '000002',
    createDateTime: DateTime.parse('2023-08-01 13:32:00.000'),
    overdueDateTime: DateTime.parse('2024-08-01 13:37:00.000'),
    items: [
      CartItemModel(
        item: apple,
        quantity: 3,
      ),
      CartItemModel(
        item: kiwi,
        quantity: 2,
      )
    ],
    status: 'delivered',
    copyAndPast: 'codigopixqualquer',
    total: 6.5,
  ),
];
