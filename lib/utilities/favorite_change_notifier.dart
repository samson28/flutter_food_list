import 'package:flutter/foundation.dart';
import 'package:learn/models/recipe.dart';
import 'package:learn/providers/recipe_box.dart';

class FavoriteChangeNotifier with ChangeNotifier {
  Recipe recipe;
  FavoriteChangeNotifier(this.recipe);

  bool get isFavorite => recipe.isFavorite;
  int get favoriteCount => recipe.favoriteCount + (recipe.isFavorite ? 1 : 0);

  set isFavorite(bool isFavorite) {
    recipe.isFavorite = isFavorite;
    RecipeBox.box.put(recipe.Key(), recipe);
    //RecipeDataBase.instance.updateRecipe(recipe);
    notifyListeners();
  }
/*
  set favoriteCount(int favoriteCount) {
    _favoriteCount = favoriteCount;
    notifyListeners();
  }*/
}
