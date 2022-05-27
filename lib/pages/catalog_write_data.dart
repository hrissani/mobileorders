import 'package:flutter/material.dart';
import 'package:mobileorders/widgets/app_bar.dart';
import 'package:mobileorders/widgets/buttun.dart';
import 'package:provider/provider.dart';

import '../bi/orders/model_order.dart';
import '../bi/orders/orders.dart';
import '../bi/orders/status_order.dart';
import '../repository/repository.dart';
import 'main_screen.dart';

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
            const AppBarCustom(
                iconLeft: Icons.arrow_back_ios_new, title: "Ввод данных"),
            _textFieldList(),
            Container(
              padding: const EdgeInsets.all(25),
              child: CustomButton(
                  text: "Поддтвердить",
                  onTap: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      final Orders providerOrders =
                          Provider.of<Orders>(context, listen: false);
                      final RespositoryApp providerRepo =
                          Provider.of<RespositoryApp>(context, listen: false);
                      final StatusOrders providerStatusOrders =
                          Provider.of<StatusOrders>(context, listen: false);
                      providerOrders.createOrder(
                          order: orderModel,
                          create: () {
                            providerRepo.createOrder(orderModel);
                            providerStatusOrders.addOrderSta(
                                orderModel,
                                // Order(idOrder: "idOrder11", urlImage: "urlImage", title: "title12", miniDescription: "miniDescription12", description: "description12"),
                                UserData(
                                    _email.text, _name.text, _password.text));
                          });
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (_) => const MainScreen()),
                          ModalRoute.withName('/home'));
                    }
                  }),
            )
          ],
        ),
      ),
    );
  }

  Widget _textFieldList() {
    return Form(
      key: _formKey,
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            TextFormField(
                controller: _email,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      // borderSide: BorderSide(color: noerrore ? Colors.grey : Colors.red ),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(12))),
                  // icon: Icon(Icons.login),
                  hintText: "Фамимлия",
                  helperText: "",
                ),
                validator: (value) {
                  if (value != null) if (value.isEmpty) {
                    return "Пустое поле";
                  } else if (value.length < 2) {
                    return "Это не Фамимлия";
                  }
                }),
            TextFormField(
                controller: _name,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      // borderSide: BorderSide(color: noerrore ? Colors.grey : Colors.red ),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(12))),
                  // icon: Icon(Icons.login),
                  hintText: "Имя",
                  helperText: "",
                ),
                validator: (value) {
                  if (value != null) if (value.isEmpty) {
                    return "Пустое поле";
                  } else if (value.length < 2) {
                    return "Это не имя";
                  }
                }),
            TextFormField(
                controller: _password,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      // borderSide: BorderSide(color: noerrore ? Colors.grey : Colors.red ),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(12))),
                  // icon: Icon(Icons.login),
                  hintText: "Введите нужную граммовку продукта",
                  helperText: "",
                ),
                validator: (value) {
                  if (value != null) if (value.isEmpty) {
                    return "Пустое поле";
                  } else if (value.length < 3) {
                    return "Короткое Описание";
                  }
                }),
          ],
        ),
      ),
    );
  }
}
