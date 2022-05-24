import 'package:flutter/material.dart';
import 'package:mobileorders/assets/text_styles.dart';
import 'package:mobileorders/widgets/app_bar.dart';
import 'package:mobileorders/widgets/image_container.dart';
import 'package:provider/provider.dart';

import '../bi/orders/model_order.dart';
import '../bi/orders/orders.dart';
import '../bi/orders/status_order.dart';

class StatusOrder extends StatelessWidget {
  const StatusOrder({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          const AppBarCustom(title: "Status orders"),
          Expanded(child: _listView(context))
        ],)
      ),
    );
  }
    Widget _listView(BuildContext context){
    final providerOrder = Provider.of<StatusOrders>(context);
    return ListView.builder(
      itemCount: providerOrder.listOrderStatus.length ,
      itemBuilder: (context, index){
        return _itemList(providerOrder.listOrderStatus, index);
      }
    );
  }
  Widget _itemList(List<StatusOrderModel> list, int index){
    return Container(
      margin:const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        border: Border.all(color: Colors.black)
      ),
      child: Row(
        children: [
          ImageCustomContainer(
            imageUrl: list[index].order.urlImage
            // "https://www.clipartmax.com/png/middle/294-2941282_food-basket-icon-market-basket-icon-png.png"
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text( list[index].order.title, style: title,),
              Text( list[index].order.miniDescription, style: description,),
              Text( list[index].order.description, style: description,),
              const Icon(Icons.access_time_rounded, color: Colors.blue,)
            ],
          )
        ],
      ),
    );
  }
}