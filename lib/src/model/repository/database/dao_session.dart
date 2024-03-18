import 'package:MoboPex/src/model/repository/database/test_cache_dao.dart';
import 'package:MoboPex/utils/logger.dart';
import 'package:sqflite/sqflite.dart';

class DaoSession {
  static DaoSession? _instance;

  late Database _db;

  late TestCacheDao testCacheDao;

  DaoSession._(Database db) {
    _db = db;
    testCacheDao = TestCacheDao(db);
    // courseDetailsDao = CourseDetailsDao(db);
  }

  factory DaoSession(Database db) {
    //if the instance exists return it and if it's not yet created call initDb() for initializing the database
    _instance ??= DaoSession._(db);
    return _instance!;
  }

  Future<void> cleanDatabase() async {
    try {
      await _db.transaction((txn) async {
        final batch = txn.batch();
        batch.delete(TestCacheDao.tableName);
        // clean database on logout or any other case
        await batch.commit();
      });
      Logger.i("DB Cleaned!");
    } catch (error) {
      throw Exception('DaoSession.cleanDatabase: ' + error.toString());
    }
  }
}
