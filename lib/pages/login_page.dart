import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mobileorders/pages/registration_page.dart';
import 'package:mobileorders/widgets/loader_dialog.dart';
import 'package:provider/provider.dart';

import '../repository/repository.dart';
import '../widgets/buttun.dart';
import '../widgets/text_fields.dart';
import 'main_screen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        margin: EdgeInsets.only(top: 0, left: 0, right: 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Image
            Container(child: _image()
                // AssetImage() ,
                ),
            SizedBox(
              height: 70,
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(top: 0, left: 25, right: 25),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 20),
                      child: Text(
                        "Вход",
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                            fontFamily: "Schyler"),
                      ),
                    ),
                    Expanded(
                      child: _field(context),
                    ),
                  ],
                ),
              ),
            )
            //titel
          ],
        ),
      ),
    ));
  }

  static const AssetImage logo = AssetImage('images/ap_image.jpeg');
  Widget _image() {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    // context.read<Profile>().getImageUrl()

    return Container(
        width: w,
        height: h * 0.3,
        decoration: const BoxDecoration(
            image: DecorationImage(image: logo, fit: BoxFit.cover)));
  }

  Widget _field(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
                controller: _email,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      // borderSide: BorderSide(color: noerrore ? Colors.grey : Colors.red ),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(12))),
                  // icon: Icon(Icons.login),
                  hintText: "Email",
                  helperText: "",
                ),
                validator: (value) {
                  String p =
                      "[a-zA-Z0-9+._%-+]{1,256}@[a-zA-Z0-9][a-zA-Z0-9-]{0,64}(.[a-zA-Z0-9][a-zA-Z0-9-]{0,25})+";
                  RegExp regExp = new RegExp(p);
                  if (value != null) if (value.isEmpty) {
                    return "Пустое поле";
                  } else if (value.length < 2) {
                    return "Это не E-mail";
                  } else if (!value.contains('@')) {
                    return "Это не E-mail";
                  } else if (regExp.hasMatch(value)) {
                    return null;
                  }
                }),
            //  TextFormField(
            //   controller: TextEditingController(),
            //   decoration:const InputDecoration(
            //       border: OutlineInputBorder(
            //         // borderSide: BorderSide(color: noerrore ? Colors.grey : Colors.red ),
            //         borderRadius:const BorderRadius.all(Radius.circular(12))
            //       ),
            //       // icon: Icon(Icons.login),
            //       hintText: "Naeme",
            //       helperText: "",
            //   ),
            //   validator: (value){
            //     if(value != null)
            //       if (value.isEmpty){
            //         return "Пустое поле";
            //       }else if(value.length <2){
            //         return "Это не имя";
            //       }
            //   }
            // ),
            TextFormField(
                controller: _password,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      // borderSide: BorderSide(color: noerrore ? Colors.grey : Colors.red ),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(12))),
                  // icon: Icon(Icons.login),
                  hintText: "Пароль",
                  helperText: "",
                ),
                validator: (value) {
                  if (value != null) if (value.isEmpty) {
                    return "Пустое поле";
                  } else if (value.length < 4) {
                    return "Короткий пароль";
                  }
                }),
            GestureDetector(
              onTap: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (_) => RegisterPage()),
                    ModalRoute.withName('/registration'));
              },
              child: const Text("Регистрация",
                  style: TextStyle(
                      color: Colors.blue,
                      fontFamily: "Schyler2",
                      fontWeight: FontWeight.w600)),
            ),
            SizedBox(
              height: 25,
            ),
            CustomButton(
                text: "Авторизация",
                onTap: () async {
                  bool login = true;
                  if (_formKey.currentState?.validate() ?? false) {
                    final RespositoryApp providerRepo =
                        Provider.of<RespositoryApp>(context, listen: false);
                    await providerRepo.login(_email.text, _password.text, () {
                      startLoadeDialog(context);
                    }, () {
                      closeLoadDialog(context);
                    }, () {
                      login = false;
                    });
                    if (login != false) {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (_) => MainScreen()),
                          ModalRoute.withName('/home'));
                    } else {
                      FocusScope.of(context).requestFocus(new FocusNode());
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        backgroundColor: Colors.red[200],
                        content: const Text(
                          "Неверный логин или пароль",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w600),
                        ),
                      ));
                    }
                  }
                }),
            SizedBox(
              height: 25,
            ),
          ],
        ),
      ),
    );
  }
}
