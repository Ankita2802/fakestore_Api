// import 'package:flutter/material.dart';
// import 'package:path/path.dart';
// import 'package:sqflite/sqflite.dart';
// import 'package:sqflite/sqlite_api.dart';
// import 'package:path_provider/path_provider.dart';
// import 'dart:io' as io;

// class DBHelper {
//   static Database? db;
//   Future<Database?> get database async {
//     if (db != null) {
//       return db;
//     }
//     db = await initDatabase();
//     return db;
//   }

//   initDatabase() async {
//     io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
//     String path = join(documentsDirectory.path, 'notes.db');
//     var _db = await openDatabase(path, version: 1, onCreate: _oncreate);
//   }

//   _oncreate(Database db, int version) async {
//     await db.execute();
//   }
// }
