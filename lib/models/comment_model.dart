import 'dart:convert';

List<Comment> commentFromJson(String str) =>
    List<Comment>.from(json.decode(str).map((x) => Comment.fromJson(x)));

String commentToJson(List<Comment> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Comment {
  Comment({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  int userId;
  int id;
  String title;
  String body;

  factory Comment.fromJson(Map<String, dynamic> json) => Comment(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
      };
}
