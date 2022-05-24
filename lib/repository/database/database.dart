import 'dao/dao_db.dart';
import 'moor_db.dart';

class DataBase {
    /// DB moor (sql).
  /// Параметры базы данных.
  final AppDatabase db;
  /// Манипулирование данными, таблицами базы данных
  late ApplicarionDao dao;
  DataBase() : db = AppDatabase() {
     dao = db.applicarionDao; 
  }

  getDataOrders() async {
   List<order_s> allOrders = await dao.getAllOrder();
  }

  getAlluser()async{
    List<user_s> allusers = await dao.getAllUser();
  }
}