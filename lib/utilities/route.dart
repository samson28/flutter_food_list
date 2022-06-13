import 'package:flutter/material.dart';
import '../models/recipe.dart';
import '../screens/recipe_form_screan.dart';
import '../screens/recipe_list_screan.dart';
import '../screens/recipe_screan.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
            builder: (context) => const RecipeListScrean());
      case '/recipe':
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => RecipeScrean(
            recipe: settings.arguments as Recipe,
          ),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            animation = CurvedAnimation(parent: animation, curve: Curves.ease);
            return FadeTransition(opacity: animation, child: child);
          },
        );
      case '/newRecipe':
        return MaterialPageRoute(
            builder: (context) => const RecipeFormScrean());
      default:
        return MaterialPageRoute(
            builder: (context) => Scaffold(
                  appBar: AppBar(
                    title: const Text("error"),
                    centerTitle: true,
                  ),
                  body: const Center(
                    child: Text("Page Not Found"),
                  ),
                ));
    }
  }
}
