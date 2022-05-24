import 'package:flutter/material.dart';
import 'package:mobileorders/assets/text_styles.dart';
import 'package:mobileorders/widgets/app_bar.dart';
import 'package:mobileorders/widgets/image_container.dart';

class StatusOrder extends StatelessWidget {
  const StatusOrder({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          AppBarCustom(title: "Status orders"),
          Expanded(child: _listView())
        ],)
      ),
    );
  }
    Widget _listView(){
    return ListView.builder(
      itemCount: 18,
      itemBuilder: (context, index){
        return _itemList(List.empty(growable: true), 0);
      }
    );
  }
  Widget _itemList(List list, int index){
    return Container(
      margin:const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        border: Border.all(color: Colors.black)
      ),
      child: Row(
        children: [
          ImageCustomContainer(
            imageUrl: "https://www.clipartmax.com/png/middle/294-2941282_food-basket-icon-market-basket-icon-png.png"
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Title", style: title,),
              Text("Description", style: description,),
            ],
          )
        ],
      ),
    );
  }
}