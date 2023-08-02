import 'package:flutter/material.dart';
import 'package:greengrocer_mobile/app/core/ui/extension/theme_extension.dart';
import 'package:greengrocer_mobile/app/core/app_data.dart' as app_data;

import '../../../components/order/order_tile.dart';

class OrdersTab extends StatelessWidget {
  const OrdersTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Pedidos',
          style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: context.primaryColor),
        ),
      ),
      body: ListView.separated(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(16),
        itemBuilder: (_, index) {
          return OrderTile(orderItem: app_data.orders[index],);
        },
        itemCount: app_data.orders.length,
        separatorBuilder: (_, index) {
          return const SizedBox(height: 10,);
        },
      ),
    );
  }
}
