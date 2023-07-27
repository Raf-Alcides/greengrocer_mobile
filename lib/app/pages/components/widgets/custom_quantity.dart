// ignore_for_file: prefer_adjacent_string_concatenation

import 'package:flutter/material.dart';
import 'package:greengrocer_mobile/app/core/ui/extension/theme_extension.dart';

class CustomQuantity extends StatelessWidget {
  final int count;
  final String medida;
  final Function(int quatity) result;
  final bool isRemove;

  const CustomQuantity({
    super.key,
    required this.count,
    required this.medida,
    required this.result, this.isRemove = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(3),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(70)),
        color: Colors.white,
        boxShadow: [
          BoxShadow(blurRadius: 1, spreadRadius: 2, color: Colors.grey),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          WidgetQuatity(
            icon: !isRemove || count > 1 ? Icons.remove : Icons.delete_forever,
            ontap: () {
              if(count == 1 && !isRemove)  return;
              int resultCount = count - 1;
              result(resultCount);
            },
            color: !isRemove || count > 1 ? Colors.grey : Colors.red,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 7),
            child: Text( count == 1 ?
              '$count$medida' : '$count $medida'+'s',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          WidgetQuatity(
            icon: Icons.add,
            ontap: () {
              int resultCount = count + 1;
              result(resultCount);
            },
            color: context.primaryColor,
          ),
        ],
      ),
    );
  }
}

class WidgetQuatity extends StatelessWidget {
  final Color color;
  final IconData icon;
  final VoidCallback ontap;

  const WidgetQuatity({
    super.key,
    required this.color,
    required this.icon,
    required this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(90),
      child: InkWell(
        borderRadius: BorderRadius.circular(90),
        onTap: ontap,
        child: Ink(
          height: 30,
          width: 30,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(50),
          ),
          child: Icon(icon, color: Colors.white),
        ),
      ),
    );
  }
}
