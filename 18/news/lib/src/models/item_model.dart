import 'dart:convert';

class ItemModel {
  final int id;
  final String title;
  final bool deleted;
  final String type;
  final String by;
  final int time;
  final String text;
  final bool dead;
  final int parent;
  final List<dynamic> kids;
  final String url;
  final int score;
  final int descendants;

  ItemModel.fromJson(Map<String, dynamic> parsedJson)
      : this.id = parsedJson['id'],
        this.title = parsedJson['title'],
        this.deleted = parsedJson['deleted'] ?? false,
        this.type = parsedJson['type'],
        this.by = parsedJson['by'] ?? "",
        this.time = parsedJson['time'] ?? 0,
        this.text = parsedJson['text'] ?? "",
        this.dead = parsedJson['dead'] ?? false,
        this.parent = parsedJson['parent'] ?? 0,
        this.kids = parsedJson['kids'] ?? [],
        this.url = parsedJson['url'],
        this.score = parsedJson['score'] ?? 0,
        this.descendants = parsedJson['descendants'] ?? 0;

  ItemModel.fromDb(Map<String, dynamic> parsedJson)
      : this.id = parsedJson['id'],
        this.title = parsedJson['title'],
        this.deleted = parsedJson['deleted'] == 1 ? true : false,
        this.type = parsedJson['type'],
        this.by = parsedJson['by'],
        this.time = parsedJson['time'] ?? 0,
        this.text = parsedJson['text'],
        this.dead = parsedJson['dead'] == 1 ? true : false,
        this.parent = parsedJson['parent'] ?? 0,
        this.kids = jsonDecode(parsedJson['kids']) ?? [],
        this.url = parsedJson['url'],
        this.score = parsedJson['score'] ?? 0,
        this.descendants = parsedJson['descendants'] ?? 0;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "id": id,
      "title": title,
      "deleted": deleted ? 1 : 0,
      "type": type,
      "by": by,
      "time": time,
      "dead": dead ? 1 : 0,
      "text": text,
      "parent": parent,
      "kids": jsonEncode(kids),
      "url": url,
      "score": score,
      "descendants": descendants,
    };
  }
}
