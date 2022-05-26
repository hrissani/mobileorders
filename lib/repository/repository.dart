import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../bi/orders/model_order.dart';
import 'api/api_app.dart';
import 'database/database.dart';


enum AuthMode { login, register, phone }

class RespositoryApp{

  ApiApp _api;
  DataBase _dataBase;
  FirebaseAuth? auth;
  User?  user;
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  RespositoryApp( FirebaseAuth? auth ) : 
  _api = ApiApp(), 
  _dataBase = DataBase()
  {
    this.auth = auth;
    if(auth != null){
      user = auth.currentUser;
    }
    
  }

  autologin(VoidCallback succeseful, VoidCallback fail)async{
    final SharedPreferences prefs = await _prefs;
    String? pasw = prefs.getString('pasw');
    String? email = prefs.getString('email');
    if(pasw != null && email != null && pasw != "" && email != "" ){
      succeseful();
    }else{
      fail();
    }
  }
  logout(VoidCallback succeseful)async{
    final SharedPreferences prefs = await _prefs;
    // prefs.remove('pasw');
    // prefs.remove('email');
    prefs.setString('pasw',"");
    prefs.setString('email',"");
    if(auth != null){
      auth!.signOut();
    }
    succeseful();
  }

  registration(String email,String password,String name, VoidCallback loadeStart, VoidCallback loadeEnd, VoidCallback errore,) async{
    await _emailAndPassword(
      AuthMode.register,
      email, password,
      loadeStart, loadeEnd,
      errore,
      name: name,
    );
  }

  login(String email,String password, VoidCallback loadeStart, VoidCallback loadeEnd, VoidCallback errore,) async{
    await _emailAndPassword(
      AuthMode.login,
      email, password,
      loadeStart, loadeEnd,
      errore
    );
  }

  createOrder(Order order){

  }

  List<Order>? getStatusOrders(){

  }

  // getProfile(){}

  // editProfile(){}

  
  Future<void> _emailAndPassword(AuthMode mode,String email,String password, VoidCallback loadeStart, VoidCallback loadeEnd, VoidCallback errore, {String? name}) async {
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
            user!.updateDisplayName(name);
        } 
      } on FirebaseAuthException catch (e) {
          error =error + '${e.message}';
          errore();
      } catch (e) {
          error =error + '$e';
          errore();
      } finally {
        final SharedPreferences prefs = await _prefs;
        prefs.setString('pasw',password);
        prefs.setString('email',email);
        loadeEnd();
      }
  }
  Future<void> _signOut() async {
    await FirebaseAuth.instance.signOut();
    // await GoogleSignIn().signOut();
  }

}

