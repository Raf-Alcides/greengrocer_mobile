
import 'package:greengrocer_mobile/app/models/item_model.dart';

class CartItemModel {
  final ItemModel item;
  int quantity;

  CartItemModel({
    required this.item, required this.quantity
  });

  double totalPrice() {
    return item.price * quantity;
  }
}