import 'package:moor_flutter/moor_flutter.dart';

@DataClassName('user_s')
class UserS extends Table {

 
  IntColumn get id => integer().nullable()();

  TextColumn get name  => text().nullable()();
  TextColumn get email  => text().nullable()();    
  TextColumn get date  => text().nullable()();  

 
}