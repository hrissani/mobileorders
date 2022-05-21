import 'package:flutter/material.dart';
import 'package:mobileorders/widgets/app_bar.dart';

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
      child: Row(
        children: [
          // ImageCustomContainer(
          //   imageUrl: ""
          // ),
          Column(
            children: [
              Text("Title"),
              Text("Description"),
            ],
          )
        ],
      ),
    );
  }
}