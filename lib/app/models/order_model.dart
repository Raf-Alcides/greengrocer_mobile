import 'package:greengrocer_mobile/app/models/cart_item_model.dart';

class OrderModel {
  final String id;
  final DateTime createDateTime;
  final DateTime overdueDateTime;
  List<CartItemModel> items;
  final String status;
  final String copyAndPast;
  final double total;

  OrderModel({
    required this.id,
    required this.createDateTime,
    required this.overdueDateTime,
    required this.items,
    required this.status,
    required this.copyAndPast,
    required this.total,
  });
}
