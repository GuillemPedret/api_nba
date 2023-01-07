import 'dart:convert';

List<Players> playerFromJson(String str) =>
    List<Players>.from(json.decode(str).map((x) => Players.fromJson(x)));

String playerToJson(List<Players> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Players {
  String? name;
  String? avatar;
  String? team;
  String? id;

  Players({
    this.id,
    this.avatar,
    this.team,
    this.name,
  });

  factory Players.fromJson(Map<String, dynamic> json) => Players(
    id: json["id"],
    avatar: json["avatar"],
    team: json["team"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "avatar": avatar,
    "name": name,
    "team": team,
  };
}
