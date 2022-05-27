import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import 'model_order.dart';

///Список того что можно заказать
class Orders extends ChangeNotifier {
  ///список типа [Order] (строгая типизация)
  List<Order> _listOrders = List.empty(growable: true);

  ///Возвращает все
  List<Order> getAllOrders() {
    Uuid uuid = Uuid();
    _listOrders.add(Order(
        description: "Черная вишня",
        miniDescription: "250/500 г",
        urlImage:
            "https://m.dom-eda.com/uploads/images/catalog/item/3264cc832b/ff3b7f9c6c_500.jpg",
        title: "Помидор черри",
        idOrder: uuid.v4().toString()));
    _listOrders.add(Order(
        description: "Герда F1",
        miniDescription: "300/600 г",
        urlImage: "https://ydachadacha.ru/img/mini-kornishony-sorta_21.jpg",
        title: "Мини-корнишоны",
        idOrder: uuid.v4().toString()));
    _listOrders.add(Order(
        description: "ДРК",
        miniDescription: "500/600 г",
        urlImage:
            "https://img.freepik.com/free-photo/fresh-red-and-pink-tomatoes-isolated-on-white-background_115919-427.jpg",
        title: "Розовый помидор",
        idOrder: uuid.v4().toString()));
    return _listOrders;
  }

  ///Вставить все заказы
  setAllOrders(List<Order> list) {
    _listOrders.addAll(list);
    notifyListeners();
  }

  ///Вставить заказ
  createOrder({required Order order, required VoidCallback create}) {
    _listOrders.add(order);
    create();
    notifyListeners();
  }

  ///Возвращает один заказ для просмотра описания
  Order? getOrder(int index) {
    return _listOrders[index];
  }
}
