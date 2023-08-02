import 'package:flutter/material.dart';
import 'package:greengrocer_mobile/app/components/order/order_status_widget.dart';
import 'package:greengrocer_mobile/app/components/widgets/custom_elevated_button.dart';
import 'package:greengrocer_mobile/app/core/ui/extension/theme_extension.dart';
import 'package:greengrocer_mobile/app/core/ui/services/utils_services.dart';
import 'package:greengrocer_mobile/app/models/cart_item_model.dart';
import 'package:greengrocer_mobile/app/models/order_model.dart';

import '../widgets/payment_dialog.dart';

class OrderTile extends StatelessWidget {
  final OrderModel orderItem;

  OrderTile({super.key, required this.orderItem});

  final UtilsServices utilsServices = UtilsServices();

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          title: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Pedido ${orderItem.id}',
                style: TextStyle(color: context.primaryColor, fontSize: 18),
              ),
              Text(
                utilsServices.formatData(orderItem.createDateTime),
                style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              )
            ],
          ),
          childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          expandedCrossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            IntrinsicHeight(
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: SizedBox(
                      height: 150,
                      child: ListView(
                          children: orderItem.items.map((e) {
                        return _OrdeItemWidget(
                          utilsServices: utilsServices,
                          e: e,
                        );
                      }).toList()),
                    ),
                  ),
                  VerticalDivider(
                    color: context.primaryColor,
                    thickness: 2,
                    width: 8,
                  ),
                  Expanded(
                    flex: 2,
                    child: OrderStatusWidget(
                      status: orderItem.status,
                      isOrvedue:
                          orderItem.overdueDateTime.isBefore(DateTime.now()),
                    ),
                  ),
                ],
              ),
            ),
            Text.rich(
              TextSpan(style: const TextStyle(fontSize: 20), children: [
                const TextSpan(
                    text: 'Total',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                TextSpan(text: utilsServices.priceToCurrent(orderItem.total))
              ]),
            ),
            const SizedBox(
              height: 7,
            ),
            Visibility(
                visible: orderItem.status == 'pending_payment',
                child: CustomElevatedButton(
                  text: 'Ver Qr Code pix',
                  onPressed: () {
                    showDialog(
                      context: context, 
                      builder: (_) {
                        return PaymentDialog(order: orderItem,);
                      },);
                  },
                ))
          ],
        ),
      ),
    );
  }
}

class _OrdeItemWidget extends StatelessWidget {
  final CartItemModel e;

  const _OrdeItemWidget({
    Key? key,
    required this.e,
    required this.utilsServices,
  }) : super(key: key);

  final UtilsServices utilsServices;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Text(
            '${e.quantity} ${e.item.unit} ',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Expanded(child: Text(e.item.itemName)),
          Text(utilsServices.priceToCurrent(e.totalPrice()))
        ],
      ),
    );
  }
}
