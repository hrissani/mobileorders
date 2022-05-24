
// import 'dart:js';

import 'package:flutter/material.dart';
import 'package:mobileorders/pages/catalog_more_info.dart';
import 'package:mobileorders/widgets/image_container.dart';

import '../assets/text_styles.dart';
import '../widgets/app_bar.dart';

class Catalog extends StatelessWidget {
  const Catalog({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          AppBarCustom(title: "Каталог"),
          Expanded(child: _listView(context))
        ]),
      ),
    );
  }
  Widget _listView(BuildContext context){
    return ListView.builder(
      itemCount: 18,
      itemBuilder: (context, index){
        return _itemList(List.empty(growable: true), 0, context);
      }
    );
  }
  Widget _itemList(List list, int index, BuildContext context){
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (_)=>MoreInfoOrder(orderModel: list[index]) ));
      },
      child: Container(
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
      ),
    );
  }
}