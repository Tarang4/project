import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:untitled/modal/user_model.dart';

class DatabaseUtils {
  DatabaseUtils._();

  static final DatabaseUtils db = DatabaseUtils._();

  Database? _userDatabase;
  String? path;

  String? createTable =
      "CREATE TABLE USER(id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,"
      "username TEXT,"
      "email TEXT NOT NULL UNIQUE,"
      "password TEXT,"
      "profile TEXT,"
      "address TEXT,"
      "phone TEXT,"
      "city TEXT,"
      "pincode TEXT)";

  get database async {
    if (_userDatabase != null) {
      return _userDatabase;
    }
    _userDatabase = await createDatabase();
    return _userDatabase;
  }

  createDatabase() async {
    String demoPath = await getDatabasesPath();
    path = join(demoPath, "user.db");
    return await openDatabase(path ?? "", version: 1, onCreate: (
      Database database,
      int version,
    ) async {
      await database.execute(createTable!);
    });
  }
  insertData(UserModel user) async {
    final db = await database;
    final result = await db?.insert("USER", user.toJson());
  }

  deleteData(int id) async {
    final db = await database;
    await db?.delete("USER", where: "id=?", whereArgs: [id]);
  }

  updateData(
      {required int id, required String email, required username}) async {
    try {
      final db = await database;
      Map<String, dynamic> map = {};
      map['username'] = username;
      map['email'] = email;
      await db.update("USER", map, where: "email=?", whereArgs: [id]);
    } catch (e) {}
  }

  updateByEmail({
    required String email,
    required String username,
    required String profile,
    required String address,
    required String phone,
    required String pincode,
    required String city,
  }) async {
    try {
      final db = await database;
      Map<String, dynamic> map = {};
      map['email'] = email;
      map['username'] = username;
      map['profile'] = profile;
      map['address'] = address;
      map['phone'] = phone;
      map['pincode'] = pincode;
      map['city'] = city;
      await db.update("USER", map, where: "email=?", whereArgs: [email]);
    } catch (e) {}
  }

  updatePassword({
    required String email,
    required String phone,
    required String password,
  }) async {
    try {
      final db = await database;
      Map<String, dynamic> map = {};
      map['password'] = password;
      await db.update("USER", map,
          where: "email=? AND phone=?", whereArgs: [email, phone]);
    } catch (e) {}
  }

  Future<List<UserModel>> getData() async {
    List<UserModel> list = [];
    UserModel model = UserModel();
    final db = await database;
    final result = await db?.rawQuery("SELECT * FROM USER");
    result?.forEach((element) {
      model = UserModel.fromjson(element);
      list.add(model);
    });
    return list;
  }
}
