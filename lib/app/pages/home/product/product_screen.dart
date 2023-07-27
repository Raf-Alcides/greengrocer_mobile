import 'package:flutter/material.dart';
import 'package:greengrocer_mobile/app/core/ui/extension/theme_extension.dart';
import 'package:greengrocer_mobile/app/core/ui/services/utils_services.dart';
import 'package:greengrocer_mobile/app/models/item_model.dart';
import 'package:greengrocer_mobile/app/pages/components/auth/custom_elevated_button.dart';
import '../../components/widgets/custom_quantity.dart';

class ProductScreen extends StatefulWidget {
  final ItemModel item;

  const ProductScreen({super.key, required this.item});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  final UtilsServices utilsServices = UtilsServices();

  int cartItemQuatity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                  child: Hero(
                      tag: widget.item.imgUrl,
                      child: Image.asset(widget.item.imgUrl))),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(32),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.shade600,
                          offset: const Offset(0, 2)),
                    ],
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(50),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              widget.item.itemName,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                              ),
                            ),
                          ),
                          CustomQuantity(
                            medida: widget.item.unit,
                            count: cartItemQuatity,
                            result: (int quantity) {
                              setState(() {
                                cartItemQuatity = quantity;
                              });
                            },
                          )
                        ],
                      ),
                      Text(
                        utilsServices.priceToCurrent(widget.item.price),
                        style: TextStyle(
                            color: context.primaryColor,
                            fontSize: 32,
                            fontWeight: FontWeight.bold),
                      ),
                      Expanded(
                          child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: SingleChildScrollView(
                            child: Text(
                          widget.item.description,
                          style: const TextStyle(height: 1.5, fontSize: 15),
                        )),
                      )),
                      CustomElevatedButton(
                        text: 'Adicionar ao Carrinho',
                        onPressed: () {},
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            top: 10,
            left: 10,
            child: SafeArea(
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(
                  Icons.arrow_back_ios_new_outlined,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
