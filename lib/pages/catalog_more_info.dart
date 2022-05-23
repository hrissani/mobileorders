import 'package:flutter/material.dart';
import 'package:mobileorders/bi/orders/model_order.dart';
import 'package:mobileorders/widgets/app_bar.dart';
import 'package:mobileorders/widgets/buttun.dart';

import 'catalog_write_data.dart';

class MoreInfoOrder extends StatelessWidget {
  final Order orderModel;
  const MoreInfoOrder({ 
    Key? key, 
    required this.orderModel
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          const AppBarCustom(title: ""),
          Expanded(child: _content(orderModel)),
          CustomButton(text: "Заказать", onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (_)=>SwriteDataOrder(orderModel: orderModel) )); 
          })
        ]),
      ),
    );
  }
  Widget _content(Order orderModelW){
    return Column(
      children: [

      ],
    );
  }
}