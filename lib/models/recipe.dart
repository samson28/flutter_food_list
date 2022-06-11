//import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
part 'recipe.g.dart';

@HiveType(typeId: 0)
class Recipe {
  @HiveField(0)
  late String title;
  @HiveField(1)
  late String user;
  @HiveField(2)
  late String imageUrl;
  @HiveField(3)
  late String description;
  @HiveField(4)
  late bool isFavorite;
  @HiveField(5)
  late int favoriteCount;

  Recipe(this.title, this.user, this.imageUrl, this.description,
      this.isFavorite, this.favoriteCount);

  String Key() => title.hashCode.toString();
/*
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'user': user,
      'imageUrl': imageUrl,
      'description': description,
      'isFavorite': isFavorite,
      'favoriteCount': favoriteCount
    };
  }

  factory Recipe.fromMap(Map<String, dynamic> map) => Recipe(
      map['title'],
      map['user'],
      map['imageUrl'],
      map['description'],
      map['isFavorite'] == 1,
      map['favoriteCount']);*/
}
