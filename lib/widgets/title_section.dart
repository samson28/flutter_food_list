import 'package:flutter/material.dart';
import 'favorite_widget.dart';
import '../models/recipe.dart';

class TileSection extends StatelessWidget {
  final Recipe recipe;
  const TileSection({Key? key, required this.recipe}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          Expanded(
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
          ),
          const FavoriteWidget()
        ],
      ),
    );
  }
}
