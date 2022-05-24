
import 'package:mobileorders/repository/database/table_moor/table_user.dart';
import 'package:moor_flutter/moor_flutter.dart';

import '../moor_db.dart';
import '../table_moor/table_order.dart';

part 'dao_db.g.dart';

@UseDao(tables: [UserS, OrderS])
class ApplicarionDao extends DatabaseAccessor<AppDatabase> 
with _$ApplicarionDaoMixin
{
  AppDatabase db;

  ApplicarionDao(this.db) :super(db);

  Future<List<user_s>> getAllUser() => select(userS).get();
  Future inserUser(user_s model) => into(userS).insert(model);
  Future updateUser(user_s model) => update(userS).replace(model);
  Future deleteUser(user_s model) => delete(userS).delete(model);

  /////////////////////

  Future<List<order_s>> getAllOrder() => select(orderS).get();
  Future insertOrder(order_s model) => into(orderS).insert(model);
  Future updateOrder(order_s model) => update(orderS).replace(model);
  Future deleteOrder(order_s model) => delete(orderS).delete(model);


}
