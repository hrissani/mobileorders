import 'package:moor_flutter/moor_flutter.dart';

@DataClassName('order_s')
class OrderS extends Table {

 
  IntColumn get id => integer().nullable()();

  TextColumn get hotelId  => text().nullable()();
  TextColumn get hotelName  => text().nullable()();    
  TextColumn get builderName  => text().nullable()();  

 
}