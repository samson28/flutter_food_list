import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:learn/models/recipe.dart';

class RecipeItemWidget extends StatelessWidget {
  final Recipe recipe;
  const RecipeItemWidget({Key? key, required this.recipe}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/recipe', arguments: recipe);
      },
      child: Card(
        margin: const EdgeInsets.all(8),
        elevation: 8,
        child: Row(
          children: [
            Hero(
              tag: "imageRecipe${recipe.title}",
              child: CachedNetworkImage(
                  imageUrl: recipe.imageUrl,
                  placeholder: (BuildContext context, String url) =>
                      const Center(
                        child: CircularProgressIndicator(),
                      ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                  fit: BoxFit.cover,
                  width: 100,
                  height: 100),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Text(
                        recipe.title,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      )),
                  Text(
                    recipe.user,
                    style: TextStyle(color: Colors.grey[500], fontSize: 16),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
