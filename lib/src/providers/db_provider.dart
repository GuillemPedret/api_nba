import 'dart:io';
import 'package:api_to_sqlite/src/models/player_model.dart';
import 'package:path/path.dart';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider {
  static Database? _database;
  static final DBProvider db = DBProvider._();

  DBProvider._();

  Future<Database?> get database async {
    // If database exists, return database
    if (_database != null) return _database;

    // If database don't exists, create one
    _database = await initDB();

    return _database;
  }

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'players.db');

    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
          await db.execute('CREATE TABLE Players('
              'name TEXT,'
              'avatar TEXT,'
              'team TEXT,'
              'id TEXT'
              ')');
        });
  }

  // Insert employee on database
  createEmployee(Players newPlayer) async {
    await deleteAllPlayers();
    final db = await database;
    final res = await db?.insert('Players', newPlayer.toJson());

    return res;
  }

  // Delete all employees
  Future<int?> deleteAllPlayers() async {
    final db = await database;
    final res = await db?.rawDelete('DELETE FROM Players');

    return res;
  }

  Future<List<Players?>> getAllPlayers() async {
    final db = await database;
    final res = await db?.rawQuery("SELECT * FROM Players");

    List<Players> list = res!.isNotEmpty ? res.map((c) => Players.fromJson(c)).toList() : [];

    return list;
  }

  Future<List<Players?>> getAllPlayersQuery({required String query}) async {
    final db = await database;
    final res = await db?.rawQuery("SELECT * FROM PLAYERS WHERE Name LIKE '%" + query + "%'");

    List<Players> list = res!.isNotEmpty ? res.map((c) => Players.fromJson(c)).toList() : [];

    return list;
  }

  Future<List<Players?>> getAllPlayersId() async {
    final db = await database;
    final res = await db?.rawQuery("SELECT id FROM PLAYERS");

    List<Players> list = res!.isNotEmpty ? res.map((c) => Players.fromJson(c)).toList() : [];


    return list;
  }

  Future<int?> getNewPlayersId(String query) async {
    final db = await database;
    final res = await db?.rawQuery("SELECT id FROM PLAYERS WHERE Name LIKE '%" + query + "%'");

    List<Players> list = res!.isNotEmpty ? res.map((c) => Players.fromJson(c)).toList() : [];

    int? tmp = 0;
    for (var i = list.length - 1; i >= 0 && tmp == 0; i--) {
      tmp = int.parse(list[i].id!);
    }

    return tmp;
  }

  Future<List<String>> getPlayerData(int playerId) async {
    final db = await database;
    final res = await db?.rawQuery("SELECT * FROM PLAYERS WHERE id LIKE '%" + playerId.toString() + "%'");

    List<Players> list = res!.isNotEmpty ? res.map((c) => Players.fromJson(c)).toList() : [];

    List<String> tmp = List.generate(4, (i) => "");

    for (var i = list.length - 1; i >= 0 && tmp[0] == "" && tmp[1] == "" && tmp[2] == ""; i--) {
      tmp[0] = list[i].name!;
      tmp[1] = list[i].avatar!;
      tmp[2] = list[i].team!;
    }

    return tmp;
  }

  insertNewPlayer(String name, String avatar, String team) async {
    final db = await database;
    db?.rawInsert('INSERT INTO Players(name, avatar, team) VALUES("' + name + '", "' + avatar + '", "' + team + '")');
  }


  Future<int?> deleteSelectedPlayer(int user) async {
    final db = await database;
    await db?.rawDelete('DELETE FROM Players WHERE id = ?', [user.toString()]);
  }
}
