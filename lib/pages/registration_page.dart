

import 'package:flutter/material.dart';
import 'package:mobileorders/pages/login_page.dart';
import 'package:mobileorders/widgets/buttun.dart';
import 'package:provider/provider.dart';

import '../bi/user/user_provider.dart';
import '../repository/repository.dart';
import '../widgets/loader_dialog.dart';
import '../widgets/text_fields.dart';
import 'main_screen.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({ Key? key }) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _name = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(top: 35, left: 25, right: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //Image
              Container(
                child: _image()
                // AssetImage() ,
              ),
              //titel
              Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                child:Text("Регистрация", style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),) ,
              ),
              Expanded(
                child: _field(context),
              ),
            ],
          ),
        ),
      )
      
    );
  }

  static const AssetImage logo = AssetImage('icons/logo.png');
  Widget _image(){
    // context.read<Profile>().getImageUrl()
    
    return Container(
      height: 120,
      width: 120,
      margin:
          EdgeInsets.symmetric(horizontal: 100),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: Colors.white,
      ),
      alignment: Alignment.center,
      child:const Image(
        image : logo,
        // IconsUpDesign.camera,
        // size: 24,
        // color: Colors.grey,
      ),
    );
  }

  Widget _field(BuildContext context){
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
              controller: TextEditingController(),
              decoration:const InputDecoration(
                  border: OutlineInputBorder(
                    // borderSide: BorderSide(color: noerrore ? Colors.grey : Colors.red ),
                    borderRadius:const BorderRadius.all(Radius.circular(12))
                  ),
                  // icon: Icon(Icons.login),
                  hintText: "Имя",
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
                  hintText: "Пароль",
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
            GestureDetector(
                onTap: (){
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_)=> LoginPage()), ModalRoute.withName('/login'));
                },
                child:const Text("Вход", style: TextStyle(color: Colors.blue),),
              ),
              SizedBox(height: 25,),
                CustomButton(
                  text: "Регистрация", 
                  onTap: ()async {
                     bool login = true;
                    if (_formKey.currentState?.validate() ?? false) {
                          final UserProvider providerUser = Provider.of<UserProvider>(context, listen: false);
                          final RespositoryApp providerRepo = Provider.of<RespositoryApp>(context, listen: false);
                          await providerUser.setUserData(name: _name.text, email: _email.text,  auth: ()async{
                          await providerRepo.registration(_email.text, _password.text, _name.text,
                              () {
                                startLoadeDialog(context);
                              }, () { 
                                closeLoadDialog(context);
                              },
                              (){
                                login = false;
                              }
                            );  
                          }
                          );
                           if(login != false){
                        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_)=> MainScreen()), ModalRoute.withName('/home'));
                      }
                      else{
                        SnackBar(
                          backgroundColor: Colors.red[200],
                          content: const Text(
                            "Ошибка ваторизации",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w600),
                          ),
                        );
                      }

                        }
                  }
                ),
               SizedBox(height: 25,),
          ],
        ),
      ),
    );
  }
  
}