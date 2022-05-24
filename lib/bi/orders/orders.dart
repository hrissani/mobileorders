

import 'package:flutter/material.dart';

import 'model_order.dart';

///Список того что можно заказать
class Orders extends ChangeNotifier{

  ///список типа [Order] (строгая типизация)
  List<Order> _listOrders = List.empty(growable: true);

  ///Возвращает все
  List<Order>? getAllOrders(){

  }
  ///Вставить все заказы
  setAllOrders(List<Order> list){
    _listOrders.addAll(list);
  }
  ///Вставить заказ
  createOrder({required Order order, required VoidCallback create}){
    _listOrders.add(order);
  }
  ///Возвращает один заказ для просмотра описания
  Order? getOrder(int index){
    return _listOrders[index];
  }
}

