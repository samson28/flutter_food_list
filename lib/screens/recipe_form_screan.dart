import 'dart:math';

import 'package:flutter/material.dart';
import '../models/recipe.dart';
import '../providers/recipe_box.dart';

class RecipeFormScrean extends StatefulWidget {
  const RecipeFormScrean({Key? key}) : super(key: key);

  @override
  State<RecipeFormScrean> createState() => _RecipeFormScreanState();
}

class _RecipeFormScreanState extends State<RecipeFormScrean> {
  final formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final userController = TextEditingController();

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    userController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Nouvelle Recette"),
      ),
      body: Form(
        key: formKey,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const Text(
                  "Ajouter une Recette.",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 25),
                ),
                const SizedBox(
                  height: 35,
                ),
                TextFormField(
                    controller: titleController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Title',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a title';
                      }
                      return null;
                    }),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                    controller: descriptionController,
                    keyboardType: TextInputType.multiline,
                    maxLines: 5,
                    minLines: 3,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Description',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a description';
                      }
                      return null;
                    }),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                    controller: userController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'User',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a Username';
                      }
                      return null;
                    }),
                const SizedBox(
                  height: 15,
                ),
                GestureDetector(
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      Recipe recipe = Recipe(
                          titleController.value.text,
                          userController.value.text,
                          "https://thumbs.dreamstime.com/b/pizza-36924315.jpg",
                          descriptionController.value.text,
                          false,
                          Random().nextInt(100));
                      RecipeBox.box.put(recipe.Key(), recipe);
                      //RecipeDataBase.instance.insertRecipe(recipe);
                      Navigator.pop(context);
                    }
                  },
                  child: Container(
                    height: 50.0,
                    padding: const EdgeInsets.all(8.0),
                    margin: const EdgeInsets.symmetric(horizontal: 8.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      color: Colors.lightBlue[500],
                    ),
                    child: const Center(
                      child: Text('Save'),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
