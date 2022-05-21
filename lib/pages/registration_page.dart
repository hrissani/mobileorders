

import 'package:flutter/material.dart';
import 'package:mobileorders/widgets/buttun.dart';

import '../widgets/text_fields.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Column(children: [
        //Image
        Container(
          // child:AssetImage() ,
        ),
        //titel
        Container(
          child:Text("Вход", style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),) ,
        ),
        Expanded(
          child: _field(),
        ),
        GestureDetector(
          child: Text("Регистрация"),
        ),
        CustomButton(
          text: "Регистрация", 
          onTap: (){

          }
        )
      ],)),
    );
  }
  Widget _field(){
    return Column(
      children: [
        TextFieldCustom(
          hint1: "Email",
          helperText: "",
          textEditingController: TextEditingController(),
          noerrore: true,
        ),
        TextFieldCustom(
          hint1: "Password",
          helperText: "",
          textEditingController: TextEditingController(),
          noerrore: true,
        ),
      ],
    );
  }
  
}