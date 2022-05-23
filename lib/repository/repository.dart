import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../bi/orders/model_order.dart';
import 'api/api_app.dart';
import 'database/database.dart';


enum AuthMode { login, register, phone }

class RespositoryApp{

  ApiApp _api;
  DataBase _dataBase;
  FirebaseAuth? auth;
  User  user = FirebaseAuth.instance.currentUser!;

  RespositoryApp( FirebaseAuth auth ) : 
  _api = ApiApp(), 
  _dataBase = DataBase()
  {
    this.auth = auth;
    user = auth.currentUser!;
  }

  autologin(){

  }

  registration(String email,String password,String name, VoidCallback loadeStart, VoidCallback loadeEnd) async{
    await _emailAndPassword(
      AuthMode.register,
      email, password,
      loadeStart, loadeEnd,
      name: name
    );
  }

  login(String email,String password, VoidCallback loadeStart, VoidCallback loadeEnd) async{
    await _emailAndPassword(
      AuthMode.login,
      email, password,
      loadeStart, loadeEnd
    );
  }

  createOrder(Order order){

  }

  getStatusOrders(){}

  getProfile(){}

  editProfile(){}
  

  
  Future<void> _emailAndPassword(AuthMode mode,String email,String password, VoidCallback loadeStart, VoidCallback loadeEnd, {String? name}) async {
     String error = "Ошибка: ";
      loadeStart();
      try {
        if (mode == AuthMode.login) {
          await auth!.signInWithEmailAndPassword(
            email: email,
            password: password,
          );
        } else if (mode == AuthMode.register) {
          await auth!.createUserWithEmailAndPassword(
            email: email,
            password: password,
          );
          if(name != null)
            user.updateDisplayName(name);
        } 
      } on FirebaseAuthException catch (e) {
          error =error + '${e.message}';
      } catch (e) {
          error =error + '$e';
      } finally {
        loadeEnd();
      }
  }
  Future<void> _signOut() async {
    await FirebaseAuth.instance.signOut();
    // await GoogleSignIn().signOut();
  }

}

