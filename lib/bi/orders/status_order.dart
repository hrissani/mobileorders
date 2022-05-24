

import 'package:flutter/material.dart';

import 'model_order.dart';


///Статус заказа, который уже заказан и  информация о нем
class StatusOrders extends ChangeNotifier{
  
  ///список типа [Order] (строгая типизация)
  List<StatusOrderModel> _listStatusOrdersOrders = List.empty(growable: true);
  List<StatusOrderModel> get listOrderStatus => _listStatusOrdersOrders;
  
  addOrder(Order order, UserData userdata){
    _listStatusOrdersOrders.add(StatusOrderModel(order: order, userData: userdata));
  }
  
}

class StatusOrderModel{
  Order order;
  UserData userData;
  StatusOrderModel({
    required this.order, 
    required this.userData
  });
}

class UserData{
  String filed1;
  String filed2;
  String filed3;
  UserData(
    this.filed1,
    this.filed2,
    this.filed3
  );
}