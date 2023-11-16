// To parse this JSON data, do
//
//     final hashtagModel = hashtagModelFromMap(jsonString);

import 'dart:convert';

HashtagModel hashtagModelFromMap(String str) =>
    HashtagModel.fromMap(json.decode(str));

String hashtagModelToMap(HashtagModel data) => json.encode(data.toMap());

class HashtagModel {
  bool? status;
  bool? error;
  String? message;
  List<Datum>? data;
  Pagination? pagination;

  HashtagModel({
    this.status,
    this.error,
    this.message,
    this.data,
    this.pagination,
  });

  factory HashtagModel.fromMap(Map<String, dynamic> json) => HashtagModel(
        status: json["status"],
        error: json["error"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromMap(x))),
        pagination: json["pagination"] == null
            ? null
            : Pagination.fromMap(json["pagination"]),
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "error": error,
        "message": message,
        "data":
            data == null ? [] : List<dynamic>.from(data!.map((x) => x.toMap())),
        "pagination": pagination?.toMap(),
      };
}

class Datum {
  int? id;
  int? userId;
  String? name;
  int? isActive;
  dynamic description;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? isFavouriteHashtagCount;

  Datum({
    this.id,
    this.userId,
    this.name,
    this.isActive,
    this.description,
    this.createdAt,
    this.updatedAt,
    this.isFavouriteHashtagCount,
  });

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
        id: json["id"],
        userId: json["user_id"],
        name: json["name"],
        isActive: json["is_active"],
        description: json["description"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        isFavouriteHashtagCount: json["is_favourite_hashtag_count"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "user_id": userId,
        "name": name,
        "is_active": isActive,
        "description": description,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "is_favourite_hashtag_count": isFavouriteHashtagCount,
      };
}

class Pagination {
  int? currentPage;
  int? perPage;
  int? total;
  int? lastPage;
  String? nextPageUrl;
  dynamic prevPageUrl;

  Pagination({
    this.currentPage,
    this.perPage,
    this.total,
    this.lastPage,
    this.nextPageUrl,
    this.prevPageUrl,
  });

  factory Pagination.fromMap(Map<String, dynamic> json) => Pagination(
        currentPage: json["current_page"],
        perPage: json["per_page"],
        total: json["total"],
        lastPage: json["last_page"],
        nextPageUrl: json["next_page_url"],
        prevPageUrl: json["prev_page_url"],
      );

  Map<String, dynamic> toMap() => {
        "current_page": currentPage,
        "per_page": perPage,
        "total": total,
        "last_page": lastPage,
        "next_page_url": nextPageUrl,
        "prev_page_url": prevPageUrl,
      };
}
