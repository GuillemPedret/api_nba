import 'package:api_to_sqlite/src/models/player_model.dart';
import 'package:api_to_sqlite/src/providers/db_provider.dart';
import 'package:dio/dio.dart';

class PlayersApiProvider {
  Future<List<Players?>> getAllPlayers() async {
    var url = "https://63b311e2ea89e3e3db3d301c.mockapi.io/players/v1/players";
    Response response = await Dio().get(url);
    return (response.data as List).map((players) {
      DBProvider.db.createPlayers(Players.fromJson(players));
    }).toList();
  }

  Future<Response> postNewPlayers(int? id, String name, String avatar, String team) async {
    var url = "https://63b311e2ea89e3e3db3d301c.mockapi.io/players/v1/players";

    return (await Dio().post(url, data: {'name': name, 'avatar': avatar, 'team': team, 'id': id}));
  }

  Future<Response> deletePlayers(int? id, String name, String avatar, String team) async {
    var url = "https://63b311e2ea89e3e3db3d301c.mockapi.io/players/v1/players";

    return (await Dio().delete(url, data: {'name': name, 'avatar': avatar, 'team': team, 'id': id}));
  }
}
