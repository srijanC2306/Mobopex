import 'package:MoboPex/src/model/data/onboarding/mock_list_model.dart';
import 'package:MoboPex/utils/utils.dart';
import 'package:sqflite/sqflite.dart';

import 'base_dao.dart';

class TestCacheDao extends BaseDao {
  static const tableName = "tbl_test_cache";
  static const columnId = "id";
  static const columnTitle = "title";
  //static const columnDescription = "description";
  static const columnSubTitle = "subTitle";

  TestCacheDao(Database db) : super(db);

  static List<String> get allColumns {
    return [
      columnId,
      columnTitle,
      //columnDescription,
      columnSubTitle,
    ];
  }

  static createTable(Database db) async {
    const sql = """
      CREATE TABLE IF NOT EXISTS $tableName(
        $columnId INTEGER NOT NULL PRIMARY KEY,
        $columnTitle TEXT,
        $columnSubTitle TEXT
      )
    """;
    return await db.execute(sql);
  }

  static dropTable(Database db) async {
    const sql = "DROP TABLE IF EXISTS $tableName";
    return await db.execute(sql);
  }

  Future<int> insert(Mylist item) async {
    return await db.insert(
      tableName,
      item.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<bool> insertAll(List<Mylist> items) async {
    try {
      for (var item in items) {
        await insert(item);
      }
      Logger.i("SUCCESSFULLY INSERTED ALL ITEMS :)");
      return true;
    } catch (e) {
      Logger.e("INSERT_ALL", error: e);
    }
    return false;
  }

  Future<int> deleteAll() async {
    return await db.delete(tableName);
  }

  Future<int> delete({required int id}) async {
    return await db.delete(
      tableName,
      where: "$columnId = ?",
      whereArgs: [id],
    );
  }

  Future<int> update(Mylist item) async {
    return await db.update(
      tableName,
      item.toJson(),
      where: "$columnId = ?",
      whereArgs: [item.id],
    );
  }

  Future<Mylist?> getById(int id) async {
    final List<Map<String, dynamic>> maps =
    await db.query(tableName, where: "$columnId=?", whereArgs: [id]);
    if (maps.isEmpty) return null;
    return Mylist.fromJson(maps.first);
  }

  Future<List<Mylist>> getAll() async {
    final List<Map<String, dynamic>> maps = await db.query(tableName);
    if (maps.isEmpty) return [];
    return maps.map((e) => Mylist.fromJson(e)).toList();
  }
}