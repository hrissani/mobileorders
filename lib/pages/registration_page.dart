

import 'package:flutter/material.dart';
import 'package:mobileorders/widgets/buttun.dart';
import 'package:provider/provider.dart';

import '../bi/user/user_provider.dart';
import '../repository/repository.dart';
import '../widgets/loader_dialog.dart';
import '../widgets/text_fields.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({ Key? key }) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _name = TextEditingController();

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
          child:const Text("Регистрация", style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),) ,
        ),
        Expanded(
          child: _field(),
        ),
        GestureDetector(
          child:const Text("Вход", style: TextStyle(color: Colors.blue),),
        ),
        CustomButton(
          text: "Регистрация", 
          onTap: (){
            if (_formKey.currentState?.validate() ?? false) {
                  final UserProvider providerUser = Provider.of<UserProvider>(context, listen: false);
                  final RespositoryApp providerRepo = Provider.of<RespositoryApp>(context, listen: false);
                  providerUser.setUserData(name: _name.text, email: _email.text,  auth: (){
                    providerRepo.registration(_email.text, _password.text, _name.text,
                      () {
                        startLoadeDialog(context);
                      }, () { 
                        closeLoadDialog(context);
                      }
                    );  
                  });
                }
          }
        )
      ],)),
    );
  }
  Widget _field(){
    return Form(
      key: _formKey,
      child: Column(
        children: [
         TextFormField(
            controller: _email,
            decoration:const InputDecoration(
                border: OutlineInputBorder(
                  // borderSide: BorderSide(color: noerrore ? Colors.grey : Colors.red ),
                  borderRadius:const BorderRadius.all(Radius.circular(12))
                ),
                // icon: Icon(Icons.login),
                hintText: "Email",
                helperText: "",
            ),
            validator: (value){
                String p = "[a-zA-Z0-9+._%-+]{1,256}@[a-zA-Z0-9][a-zA-Z0-9-]{0,64}(.[a-zA-Z0-9][a-zA-Z0-9-]{0,25})+";
                RegExp regExp = new RegExp(p);
                if(value != null)
                  if (value.isEmpty){
                    return "Пустое поле";
                  }else if(value.length <2){
                    return "Это не E-mail";
                  }else if(!value.contains('@')){
                    return "Это не E-mail";
                  }else if (regExp.hasMatch(value)){
                    return null;
                  }
            }
          ),
           TextFormField(
            controller: _name,
            decoration:const InputDecoration(
                border: OutlineInputBorder(
                  // borderSide: BorderSide(color: noerrore ? Colors.grey : Colors.red ),
                  borderRadius:const BorderRadius.all(Radius.circular(12))
                ),
                // icon: Icon(Icons.login),
                hintText: "Naeme",
                helperText: "",
            ),
            validator: (value){
              if(value != null)
                if (value.isEmpty){
                  return "Пустое поле";
                }else if(value.length <2){
                  return "Это не имя";
                }
            }
          ),
           TextFormField(
            controller: _password,
            decoration:const InputDecoration(
                border: OutlineInputBorder(
                  // borderSide: BorderSide(color: noerrore ? Colors.grey : Colors.red ),
                  borderRadius:const BorderRadius.all(Radius.circular(12))
                ),
                // icon: Icon(Icons.login),
                hintText: "Password",
                helperText: "",
            ),
            validator: (value){
               if(value != null)
                if (value.isEmpty){
                  return "Пустое поле";
                }else if(value.length <4){
                  return "Короткий пароль";
                }
            }
          ),
        ],
      ),
    );
  }
  
}