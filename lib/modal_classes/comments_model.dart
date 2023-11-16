// To parse this JSON data, do
//
//     final commentsModel = commentsModelFromMap(jsonString);

import 'dart:convert';

CommentsModel commentsModelFromMap(String str) =>
    CommentsModel.fromMap(json.decode(str));

String commentsModelToMap(CommentsModel data) => json.encode(data.toMap());

class CommentsModel {
  bool? status;
  String? message;
  List<Datum>? data;

  CommentsModel({
    this.status,
    this.message,
    this.data,
  });

  factory CommentsModel.fromMap(Map<String, dynamic> json) => CommentsModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "message": message,
        "data":
            data == null ? [] : List<dynamic>.from(data!.map((x) => x.toMap())),
      };
}

class Datum {
  int? id;
  String? comment;
  int? userId;
  String? avatar;
  String? name;
  int? commentLikeCounter;

  Datum({
    this.id,
    this.comment,
    this.userId,
    this.avatar,
    this.name,
    this.commentLikeCounter,
  });

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
        id: json["id"],
        comment: json["comment"],
        userId: json["user_id"],
        avatar: json["avatar"],
        name: json["name"],
        commentLikeCounter: json["comment_like_counter"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "comment": comment,
        "user_id": userId,
        "avatar": avatar,
        "name": name,
        "comment_like_counter": commentLikeCounter,
      };
}
