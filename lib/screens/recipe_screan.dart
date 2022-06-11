import 'package:flutter/material.dart';
import 'package:learn/utilities/favorite_change_notifier.dart';
import '../widgets/title_section.dart';
import '../widgets/button_section.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:learn/models/recipe.dart';
import 'package:provider/provider.dart';
//import 'package:transparent_image/transparent_image.dart';

class RecipeScrean extends StatelessWidget {
  final Recipe recipe;
  const RecipeScrean({
    Key? key,
    required this.recipe,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => FavoriteChangeNotifier(recipe),
      child: Scaffold(
          appBar: AppBar(
            title: const Text("Mes Recettes"),
          ),
          body: ListView(
            children: [
              Hero(
                tag: "imageRecipe" + recipe.title,
                child: CachedNetworkImage(
                    imageUrl: recipe.imageUrl,
                    placeholder: (BuildContext context, String url) =>
                        const Center(
                          child: CircularProgressIndicator(),
                        ),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                    fit: BoxFit.cover,
                    width: 600,
                    height: 240),
              ),
              TileSection(recipe: recipe),
              const SizedBox(
                height: 8,
              ),
              const ButtonSection(),
              Container(
                  padding: const EdgeInsets.all(28),
                  child: Text(recipe.description, softWrap: true))
            ],
          )),
    );
  }
}
