

import 'package:flutter/material.dart';

import 'model_order.dart';

///Список того что можно заказать
class Orders extends ChangeNotifier{

  ///список типа [Order] (строгая типизация)
  List<Order> _listOrders = List.empty(growable: true);

  ///Возвращает все
  getAllOrders(){

  }
  ///Вставить все заказы
  setAllOrders(){

  }
  ///Вставить заказ
  setOrder(){

  }
  ///Возвращает один заказ для просмотра описания
  getOrder(){

  }
}

