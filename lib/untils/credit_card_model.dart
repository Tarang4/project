import 'dart:io';
import 'package:path/path.dart';
import 'package:flutter/services.dart';
import 'package:sqflite/sqflite.dart';
import 'package:untitled/modal/credit_card_model.dart';

class DbHelper {
  Database? db;

  get database async {
    if (db != null) {
      return db;
    }
    db = await createDatabase();
    return db;
  }

  createDatabase() async {
    String path = await getDatabasesPath();
    String dbPath = join(path,"cards.db");
    if (FileSystemEntity.typeSync(dbPath) == FileSystemEntityType.notFound) {
      ByteData data = await rootBundle.load("assets/databases/ecommerce.db");
      List<int> bytes =
      data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      await File(dbPath).writeAsBytes(bytes);
    }
    var db = await openDatabase(dbPath);
    return db;
  }

  insert(CardModel card) async {
    Map<String, dynamic> map = {};
    map["cardnumber"] = card.cardnumber;
    map["expirydate"] = card.expirydate;
    map["cardname"] = card.cardname;
    map["cvv"] = card.cvv;
    final db = await database;
    await db?.insert("payment_card", map);
  }

  delete(int id) async {
    final db = await database;
    await db?.delete("payment_card", where: "id=?", whereArgs: [id]);
  }

  getData() async {
    List<CardModel> list = [];
    final db = await database;
    final result = await db.rawQuery("SELECT * FROM payment_card");
    if (result != null && result.isNotEmpty) {
      result?.forEach((element) {
        CardModel model = CardModel.fromJson(element);
        list.add(model);
      });
    }
    return list;
  }
}
