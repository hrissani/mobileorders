
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AppBarCustom extends StatelessWidget {
  final String title;
  final IconData? iconLeft;
  final IconData? iconRigth;
  const AppBarCustom({ Key? key , 
  required this.title , 
  this.iconLeft, 
  this.iconRigth 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          iconLeft == null ? const SizedBox(width: 20,)  :
          IconButton(onPressed: (){
            Navigator.of(context).pop();
          }, icon: Icon(iconLeft)),
          const Spacer(),
          Text(title, style:const TextStyle(fontSize: 22, fontWeight: FontWeight.w600, ),),
          const Spacer(),
          iconRigth == null ? const SizedBox(width: 20,)  :
          IconButton(onPressed: (){}, icon:  Icon(iconRigth)),
        ],
      ),
    );
  }
}