

import 'package:flutter/material.dart';

class ErroreNetwork extends StatelessWidget {
  const ErroreNetwork({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.red,
        child: const Center(
          child: Text("Соединение с интеренетом прервано", style: TextStyle(color: Colors.white),),
        ),
      ),
    );
  }
}