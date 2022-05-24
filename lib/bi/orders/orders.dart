

import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import 'model_order.dart';

///Список того что можно заказать
class Orders extends ChangeNotifier{

  ///список типа [Order] (строгая типизация)
  List<Order> _listOrders = List.empty(growable: true);

  ///Возвращает все
  List<Order> getAllOrders(){
    Uuid uuid = Uuid();
    _listOrders.add(
      Order(
        description: "description", 
        miniDescription: "minidescription", 
        urlImage: "https://www.clipartmax.com/png/middle/294-2941282_food-basket-icon-market-basket-icon-png.png", 
        title: "title",
        idOrder: uuid.v4().toString()
      )
    );
    _listOrders.add(
      Order(
        description: "description2", 
        miniDescription: "minidescription2", 
        urlImage: "https://www.clipartmax.com/png/middle/294-2941282_food-basket-icon-market-basket-icon-png.png", 
        title: "title",
        idOrder: uuid.v4().toString()
      )
    );
     _listOrders.add(
      Order(
        description: "description3", 
        miniDescription: "minidescription3", 
        urlImage: "https://www.clipartmax.com/png/middle/294-2941282_food-basket-icon-market-basket-icon-png.png", 
        title: "title",
        idOrder: uuid.v4().toString()
      )
    );
    return _listOrders;
  }
  ///Вставить все заказы
  setAllOrders(List<Order> list){
    _listOrders.addAll(list);
     notifyListeners();
  }
  ///Вставить заказ
  createOrder({required Order order, required VoidCallback create}){
    _listOrders.add(order);
    create();
     notifyListeners();
  }
  ///Возвращает один заказ для просмотра описания
  Order? getOrder(int index){
    return _listOrders[index];
  }
}

