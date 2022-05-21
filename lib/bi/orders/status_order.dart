

import 'package:flutter/material.dart';

import 'model_order.dart';


///Статус заказа, который уже заказан и  информация о нем
class StatusOrders extends ChangeNotifier{
  
  ///список типа [Order] (строгая типизация)
  List<Order> _listOrders = List.empty(growable: true);

  
}