// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:greengrocer_mobile/app/core/ui/extension/theme_extension.dart';
import 'package:greengrocer_mobile/app/core/ui/services/utils_services.dart';
import 'package:greengrocer_mobile/app/models/cart_item_model.dart';
import 'package:greengrocer_mobile/app/components/widgets/custom_elevated_button.dart';
import '../../../components/widgets/payment_dialog.dart';
import '../../../core/app_data.dart' as app_data;
import '../../../components/cart/cart_tile.dart';

class CartTab extends StatefulWidget {
  const CartTab({super.key});

  @override
  State<CartTab> createState() => _CartTabState();
}

class _CartTabState extends State<CartTab> {
  final UtilsServices utilsServices = UtilsServices();

  void removeItemCart(CartItemModel cartItem) {
    setState(() {
      app_data.cartItem.remove(cartItem);
    });
  }

  double cartTotalPrice() {
    double total = 0;
    for (var item in app_data.cartItem) {
      total += item.totalPrice();
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Carrinho',
          style: TextStyle(fontSize: 25, color: context.primaryColor),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: app_data.cartItem.length,
              itemBuilder: (_, index) => CartTile(
                cartItem: app_data.cartItem[index],
                remove: removeItemCart,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text('Total geral'),
                  Text(
                    utilsServices.priceToCurrent(cartTotalPrice()),
                    style: TextStyle(
                        color: context.primaryColor,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                  CustomElevatedButton(
                      text: 'Concluir Pedido',
                      onPressed: () async {
                        bool? result = await showOrderConfimation();

                        if (result ?? false) {
                          showDialog(
                            context: context,
                            builder: (_) {
                              return PaymentDialog(
                                order: app_data.orders.first,
                              );
                            },
                          );
                        }
                      })
                ]),
          ),
        ],
      ),
    );
  }

  Future<bool?> showOrderConfimation() {
    return showDialog<bool>(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            title: const Text('Confirmação'),
            content: const Text('Deseja realmente concluir o Pedido?'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
                child: const Text('Não'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
                child: const Text('Sim'),
              )
            ],
          );
        });
  }
}
