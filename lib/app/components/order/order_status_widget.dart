// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:greengrocer_mobile/app/core/ui/extension/theme_extension.dart';

class OrderStatusWidget extends StatelessWidget {
  final String status;
  final bool isOrvedue;

  final Map<String, int> allStatus = <String, int>{
    'pending_payment': 0,
    'refunded': 1,
    'paid': 2,
    'preparing_purchase': 3,
    'shipping': 4,
    'delivered': 5,
  };

  int get currentStatus => allStatus[status]!;

  OrderStatusWidget({
    super.key,
    required this.status,
    required this.isOrvedue,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _StatusDot(isActive: true, title: 'Pedido Confirmado'),
        const _DividerWidget(),
        if(currentStatus == 1) ...[
          const _StatusDot(isActive: true, title: 'Pix Estornado',color: Colors.orange,)
        ] else if(isOrvedue) ...[
          const _StatusDot(isActive: true, title: 'Pagamento pix Vencido', color: Colors.red,),
        ] else ...[
          _StatusDot(isActive: currentStatus >=2 , title: 'Pagamento',),
          const _DividerWidget(),
          _StatusDot(isActive: currentStatus >=3 , title: 'Preparando',),
          const _DividerWidget(),
          _StatusDot(isActive: currentStatus >= 4, title: 'Envio',),
          const _DividerWidget(),
          _StatusDot(isActive: currentStatus == 5, title: 'Recebido',),
        ]
      ],
    );
  }
}

class _DividerWidget extends StatelessWidget {
  const _DividerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 12,
      width: 2,
      color: context.primaryColor,
      margin: const EdgeInsets.symmetric(horizontal: 8,vertical: 2),
    );
  }
}

class _StatusDot extends StatelessWidget {

  final bool isActive;
  final String title;
  final Color? color;

  const _StatusDot({
    required this.isActive, required this.title, this.color
    
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 20,
          width: 20,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: context.primaryColor
            ),
            color: isActive ? color ??  context.primaryColor : Colors.transparent
          ),
          child: isActive ? const Icon(Icons.check, size: 15, color: Colors.white,) : const SizedBox.shrink(),
        ),
        const SizedBox(width: 5,),
        Expanded(child: Text(title))
      ],
    );
  }
}
