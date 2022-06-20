// To parse this JSON data, do
//
//     final categoryResponse = categoryResponseFromJson(jsonString);

import 'dart:convert';

List<CategoryResponse> categoryResponseFromJson(String str) => List<CategoryResponse>.from(json.decode(str).map((x) => CategoryResponse.fromJson(x)));

String categoryResponseToJson(List<CategoryResponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CategoryResponse {
  CategoryResponse({
    required this.userId,
    required this.id,
    required this.title,
    required this.completed,
  });

  int userId;
  int id;
  String title;
  bool completed;

  factory CategoryResponse.fromJson(Map<String, dynamic> json) => CategoryResponse(
    userId: json["userId"],
    id: json["id"],
    title: json["title"],
    completed: json["completed"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "id": id,
    "title": title,
    "completed": completed,
  };
}
