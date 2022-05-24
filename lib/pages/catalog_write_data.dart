import 'package:flutter/material.dart';
import 'package:mobileorders/widgets/app_bar.dart';
import 'package:mobileorders/widgets/buttun.dart';
import 'package:provider/provider.dart';

import '../bi/orders/model_order.dart';
import '../bi/orders/orders.dart';
import '../bi/orders/status_order.dart';
import '../repository/repository.dart';

class SwriteDataOrder extends StatelessWidget {
  final Order orderModel;
  SwriteDataOrder({ 
    Key? key,
    required this.orderModel,
  }) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _name = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const AppBarCustom(title: "Ввод данных"),
            _textFieldList(),
            CustomButton(text: "Поддтвердить", onTap: (){
              if (_formKey.currentState?.validate() ?? false) {
                final Orders providerOrders = Provider.of<Orders>(context, listen: false);
                final RespositoryApp providerRepo = Provider.of<RespositoryApp>(context, listen: false);
                final StatusOrders providerStatusOrders = Provider.of<StatusOrders>(context, listen: false);
                providerOrders.createOrder(
                  order: orderModel,
                  create: (){
                    providerRepo.createOrder(orderModel);
                    providerStatusOrders.addOrder(orderModel);
                  }
                );
              }
            })
          ],
        ),
      ),
    );
  }
  Widget _textFieldList(){
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