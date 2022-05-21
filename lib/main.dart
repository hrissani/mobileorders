import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mobileorders/bi/orders/status_order.dart';
import 'package:mobileorders/bi/profile/profile.dart';
import 'package:mobileorders/pages/main_screen.dart';
import 'package:mobileorders/repository/repository.dart';
import 'package:provider/provider.dart';

import 'bi/orders/orders.dart';
import 'bi/user/user_provider.dart';
/// UML diagram нужен только при генерации UML по коду
// import 'package:dcdg/dcdg.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ///Api и база данных
        Provider(
          create: (context) => RespositoryApp(),
          dispose: (context, RespositoryApp value) async {
          },
        ),

        ChangeNotifierProvider(create: (_)=> StatusOrders()),
        ChangeNotifierProvider(create: (_)=> Orders()),
        ChangeNotifierProvider(create: (_)=> Profile()),
        ChangeNotifierProvider(create: (_)=> UserProvider())

      ],
      child: MaterialApp(
        title: 'Имя приложения',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        home: const MainScreen()
      ),
    );
  }
}

