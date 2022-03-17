import 'dart:io';
import 'package:path/path.dart';
import 'package:flutter/services.dart';
import 'package:sqflite/sqflite.dart';

// class DbHelper {
//   Database? db;
//
//   get database async {
//     if (db != null) {
//       return db;
//     }
//     db = await createDatabase();
//     return db;
//   }
//
//   createDatabase() async {
//     String path = await getDatabasesPath();
//     String dbPath = join(path, "payment_card.db");
//     if (FileSystemEntity.typeSync(dbPath) == FileSystemEntityType.notFound) {
//       ByteData data = await rootBundle.load("assets/databases/ecommerce.db");
//       List<int> bytes =
//           data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
//       await File(dbPath).writeAsBytes(bytes);
//     }
//     var db = await openDatabase(dbPath);
//     return db;
//   }
//
//   insert(CardModel card) async {
//     Map<String, dynamic> map = {};
//     map["cardnumber"] = card.cardnumber;
//     map["expirydate"] = card.expirydate;
//     map["cardname"] = card.cardname;
//     map["cvv"] = card.cvv;
//     final db = await database;
//     await db?.insert("payment_card", map);
//   }
//
//   updatedCard({
//     required int id,
//     required String cardNumber,
//     required String expiryDate,
//     required String cardName,
//     required String cvv,
//   }) async {
//     try {
//       final db = await database;
//       Map<String, dynamic> map = {};
//       map['id'] = id;
//       map['cardnumber'] = cardNumber;
//       map['expirydate'] = expiryDate;
//       map['cardname'] = cardName;
//       map['cvv'] = cvv;
//       await db.update("payment_card", map, where: "id=?", whereArgs: [id]);
//       getData();
//     } catch (e) {}
//   }
//
//   delete(int id) async {
//     final db = await database;
//     await db?.delete("payment_card", where: "id=?", whereArgs: [id]);
//   }
//
//   getData() async {
//     List<CardModel> list = [];
//     final db = await database;
//     final result = await db.rawQuery("SELECT * FROM payment_card");
//     if (result != null && result.isNotEmpty) {
//       result?.forEach((element) {
//         CardModel model = CardModel.fromJson(element);
//         list.add(model);
//       });
//     }
//     return list;
//   }
// }
