

import 'package:flutter/material.dart';

import '../widgets/buttun.dart';
import '../widgets/text_fields.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({ Key? key }) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          //Image
          Container(
            // child:
            //AssetImage() ,
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
        ],
      )
      
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
          hint1: "Name",
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