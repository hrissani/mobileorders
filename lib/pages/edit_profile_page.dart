

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../bi/user/user_provider.dart';
import '../widgets/app_bar.dart';
import '../widgets/buttun.dart';

class EditProfileM extends StatelessWidget {
   EditProfileM({ Key? key }) : super(key: key);

  DateTime date = DateTime.now();
  TextEditingController _textEditingController1 = TextEditingController();
  TextEditingController _textEditingController2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SafeArea(
        child:Column(children: [
          const AppBarCustom(iconLeft: Icons.arrow_back_ios_new ,  title: "Редактирование профиля"),
           SizedBox(height: 90,),
          _image(),
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(15),
              child: _textField(context),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            child: CustomButton(
              text: "Сохранить", 
              onTap: (){
                FocusScope.of(context).requestFocus(new FocusNode());
                var provider = Provider.of<UserProvider>(context, listen: false);
                provider.setUserData(name: _textEditingController1.text, email: _textEditingController2.text, auth: (){});
                Navigator.pop(context);
              }
            ),
          )
        ]) ,
      )
    );
  }

  static const AssetImage imageProf = AssetImage('images/avatar.png');
  Widget _image(){
    return Container(
      height: 120,
      width: 120,
      margin:
         const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: Colors.white,
      ),
      alignment: Alignment.center,
      child:const Image(
        image : imageProf,
      ),
    );
  }
  
  Widget _textField(BuildContext context){
    var provider = Provider.of<UserProvider>(context, listen: false);
    _textEditingController1.text =  provider.name;
    _textEditingController2.text =  provider.email;
    return Form(
      child: SingleChildScrollView(
        child: Column(children: [
          TextField(
            controller: _textEditingController1,
            decoration:const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Имя",
                helperText: "Имя пользователя",
            )
          ),
          const SizedBox(height: 15,),
          TextField(
            controller: _textEditingController2,
            decoration:const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Email",
                helperText: "Email пользователя",
            )
          ),
          Container(
            padding: const EdgeInsets.all(20),
            child: CustomButton(
              text: "изменить дату", 
              onTap: (){
                showCupertinoModalPopup(
                context: context,
                builder: (context) => DraggableScrollableSheet(
                    maxChildSize: 1,
                    minChildSize: 0.1,
                    initialChildSize: 300 / MediaQuery.of(context).size.height,
                    builder: (context, scroll) => CupertinoDatePicker(
                      onDateTimeChanged: (DateTime _time) =>
                      date = _time,
                      initialDateTime: date,
                      maximumDate: DateTime.now(),
                      minimumDate: DateTime(1870),
                      backgroundColor: Colors.white,
                      mode: CupertinoDatePickerMode.date,
                    ))).then((_) { 
                      
                    });
              }
            ),
          )
        ],),
      ),
    );
  }
  
}