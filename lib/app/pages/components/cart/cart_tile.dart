import 'package:flutter/material.dart';
import 'package:greengrocer_mobile/app/core/ui/extension/theme_extension.dart';
import 'package:greengrocer_mobile/app/core/ui/services/utils_services.dart';
import 'package:greengrocer_mobile/app/models/cart_item_model.dart';
import 'package:greengrocer_mobile/app/pages/components/widgets/custom_quantity.dart';

class CartTile extends StatefulWidget {

  final CartItemModel cartItem;
  final Function(CartItemModel) remove;


  const CartTile({super.key, required this.cartItem, required this.remove});

  @override
  State<CartTile> createState() => _CartTileState();
}

class _CartTileState extends State<CartTile> {
  final UtilsServices utilsServices = UtilsServices();
  

  

  @override
  Widget build(BuildContext context) {
    return  Card(
      margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16)
      ),
      child: ListTile(
        leading: Image.asset(widget.cartItem.item.imgUrl, height: 60, width: 60,),
        title: Text(widget.cartItem.item.itemName, style: const TextStyle(fontWeight: FontWeight.w500),),
        subtitle: Text(utilsServices.priceToCurrent(widget.cartItem.totalPrice()), style: TextStyle( color: context.primaryColor, fontWeight: FontWeight.bold),),
        trailing: CustomQuantity(
          count: widget.cartItem.quantity, 
          medida: widget.cartItem.item.unit, 
          result: (quantity) {
            setState(() {
              widget.cartItem.quantity = quantity;

              if(quantity == 0) {
                widget.remove(widget.cartItem);
              }
            });
          },
          isRemove: true,
        ),
      ),
    );
  }
}
