

import 'dart:async';

import 'package:flutter/material.dart';

Timer? _timer_loadinDialog;

startLoadeDialog(BuildContext contextW, 
// Timer? _timer_loadinDialog
) {
    AlertDialog alert = AlertDialog(
      content: Row(
        children: [
          CircularProgressIndicator(),
          Container(
              margin: EdgeInsets.only(left: 7), child: Text("Загрузка...")),
        ],
      ),
    );
    showDialog(
      barrierDismissible: false,
      context: contextW,
      builder: (BuildContext context) {
        return alert;
      },
    );
    _timer_loadinDialog = Timer( Duration(seconds: 10), () {
      if (_timer_loadinDialog!.isActive) {
        print("10 seconds TIMER TIMEOUT CLOSE");
        closeLoadDialog(contextW);
        _timer_loadinDialog!.cancel();
        
      }
    });

}
closeLoadDialog(BuildContext contextW){
  Navigator.pop(contextW);
}