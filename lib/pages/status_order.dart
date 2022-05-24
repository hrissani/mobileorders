import 'package:flutter/material.dart';
import 'package:mobileorders/assets/text_styles.dart';
import 'package:mobileorders/widgets/app_bar.dart';
import 'package:mobileorders/widgets/image_container.dart';
import 'package:provider/provider.dart';
import '../bi/orders/status_order.dart';

class StatusOrder extends StatelessWidget {
  const StatusOrder({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          const AppBarCustom(title: "Статус заказа"),
          Expanded(child: _listView(context))
        ],)
      ),
    );
  }
    Widget _listView(BuildContext context){
    final providerOrder = Provider.of<StatusOrders>(context);
    return ListView.builder(
      itemCount:  providerOrder.listOrderStatus.length ,
      itemBuilder: (context, index){
        return _itemList(providerOrder.listOrderStatus, index);
      }
    );
  }
  Widget _itemList(List<StatusOrderModel> list, int index){
    return Container(
      padding:const EdgeInsets.all(10),
      margin:const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
        borderRadius:const BorderRadius.all(Radius.circular(12)),
        border: Border.all(color: Colors.black),
        color: Colors.amber[100]
      ),
      child: Row(
        children: [
          ImageCustomContainer(
            imageUrl: list[index].order.urlImage
          ),
          const SizedBox(width: 10,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text( list[index].order.title, style: title,),
              const SizedBox(height: 8,),
              Text( list[index].order.miniDescription, style: description,),
              const SizedBox(height: 8,),
              Text( list[index].order.description, style: description,),
              const SizedBox(height: 8,),
              Text( list[index].userData.filed1, style: description,),
              const SizedBox(height: 8,),
              const Icon(Icons.access_time_rounded, color: Colors.blue,)
            ],
          )
        ],
      ),
    );
  }
}