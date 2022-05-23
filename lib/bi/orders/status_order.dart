

import 'package:flutter/material.dart';

import 'model_order.dart';


///Статус заказа, который уже заказан и  информация о нем
class StatusOrders extends ChangeNotifier{
  
  ///список типа [Order] (строгая типизация)
  List<Order> _listStatusOrdersOrders = List.empty(growable: true);
  List<Order> get listOrderStatus => _listStatusOrdersOrders;
  
  addOrder(Order order){
    _listStatusOrdersOrders.add(order);
  }
  
}