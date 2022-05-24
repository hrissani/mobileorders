import 'package:moor_flutter/moor_flutter.dart';

import 'dao/dao_db.dart';
import 'table_moor/table_order.dart';
import 'table_moor/table_user.dart';


part 'moor_db.g.dart';

@UseMoor(tables: [UserS, OrderS], daos: [ApplicarionDao])
class AppDatabase extends _$AppDatabase {
  AppDatabase()
          : super((FlutterQueryExecutor.inDatabaseFolder(
            path: 'db2k3422.sqlite',
            logStatements: true,
            )));

  @override
  int get schemaVersion => 1;

}