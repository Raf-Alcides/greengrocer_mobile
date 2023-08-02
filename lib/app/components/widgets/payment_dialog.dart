// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

import 'package:greengrocer_mobile/app/components/widgets/custom_elevated_button.dart';
import 'package:greengrocer_mobile/app/core/ui/services/utils_services.dart';
import 'package:greengrocer_mobile/app/models/order_model.dart';

class PaymentDialog extends StatelessWidget {

  final OrderModel order;

  PaymentDialog({
    Key? key,
    required this.order,
  }) : super(key: key);

  UtilsServices utilsServices = UtilsServices();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Text('Pagamento Com pix', style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16 
                  )),
                ),
                QrImageView(
                  data: order.copyAndPast,
                  version: QrVersions.auto,
                  size: 200.0,
                ),
                const SizedBox(height: 5,),
                Text('Validade: ${utilsServices.formatData(order.overdueDateTime)}'),
                const SizedBox(height: 5,),
                CustomElevatedButton(text: 'Copiar Codigo', onPressed: () {})
              ],
            ),
          ),
          Positioned(
            right: 0,
            top: 0,
            child: IconButton(onPressed: () {
              Navigator.of(context).pop();
            }, icon: const Icon(Icons.close)))
        ],
      ),
    );
  }
}
