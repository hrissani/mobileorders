

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/app_bar.dart';
import '../widgets/buttun.dart';

class EditProfile extends StatelessWidget {
   EditProfile({ Key? key }) : super(key: key);

  DateTime date = DateTime.now();
  TextEditingController _textEditingController1 = TextEditingController();
  TextEditingController _textEditingController2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SafeArea(
        child:Column(children: [
          AppBarCustom(title: "Profile"),
          // /profileimage
          Container(
            margin:const EdgeInsets.all(15),
            child: Expanded(child: _textField()),
          ),
          CustomButton(
            text: "Сохранить", 
            onTap: (){
              Navigator.pop(context);
            }
          )
        ]) ,
      )
    );
  }
  
  Widget _textField(){
    return Column(children: [
      TextField(
        controller: _textEditingController1,
        decoration:const InputDecoration(
            border: OutlineInputBorder(),
            icon: Icon(Icons.login),
            hintText: "Настя",
            helperText: "Имя пользователя",
        )
      ),
      TextField(
        controller: _textEditingController2,
        decoration:const InputDecoration(
            border: OutlineInputBorder(),
            icon: Icon(Icons.login),
            hintText: "Aaaasf",
            helperText: "Фамилия пользователя",
        )
      ),
      CupertinoDatePicker(
        onDateTimeChanged: (DateTime _time) =>
            date = _time,
        initialDateTime: date,
        maximumDate: DateTime.now(),
        minimumDate: DateTime(1870),
        backgroundColor: Colors.white,
        mode: CupertinoDatePickerMode.date,
      ),
    ],);
  }
  
}