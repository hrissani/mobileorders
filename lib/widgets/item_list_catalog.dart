


import 'package:flutter/material.dart';

import 'image_container.dart';

class ItemListCatalog extends StatelessWidget {
  const ItemListCatalog({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(12))
      ),
      child: Row(children: [
        const ImageCustomContainer(imageUrl: "https://upload.wikimedia.org/wikipedia/ru/9/98/Mickey_Mouse_in_Steamboat_Willie%2C_1928.jpg",),
        Column(children: [
          Text("title"),
          Text("description"),
          Row(children: [
            Icon(Icons.ac_unit_rounded, color: Colors.blue[300],),
             Icon(Icons.accessibility_new_rounded, color: Colors.green[300],),
          ],)
        ],)
      ]),
    );
  }
}