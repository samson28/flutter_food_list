import 'package:flutter/material.dart';
import '../providers/recipe_box.dart';
import '../widgets/recipe_item_widget.dart';
import 'package:hive_flutter/hive_flutter.dart';

class RecipeListScrean extends StatefulWidget {
  const RecipeListScrean({Key? key}) : super(key: key);

  @override
  State<RecipeListScrean> createState() => _RecipeListScreanState();
}

class _RecipeListScreanState extends State<RecipeListScrean> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mes Recettes"),
      ),
      body: ValueListenableBuilder(
          valueListenable: RecipeBox.box.listenable(),
          builder: (context, Box items, _) {
            List<String> keys = items.keys.cast<String>().toList();

            return ListView.builder(
              itemCount: keys.length,
              itemBuilder: (context, index) {
                final recipe = items.get(keys[index].toString());
                return Dismissible(
                    key: Key(recipe.title),
                    onDismissed: (direction) {
                      setState(() {
                        RecipeBox.box.delete(recipe.Key());
                        //RecipeDataBase.instance.deleteRecipe(recipe.title);
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("${recipe.title} supprimé")));
                    },
                    background: Container(color: Colors.red),
                    child: RecipeItemWidget(recipe: recipe));
              },
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, '/newRecipe'),
        child: const Icon(Icons.add),
      ),
    );
  }
}
