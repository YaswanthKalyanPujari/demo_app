import 'package:flutter/material.dart';

class RecipeDetailScreen extends StatelessWidget {
  final Map<String, dynamic> recipe;

  const RecipeDetailScreen({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(recipe['label']),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.blueGrey, // Change background color
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Image.network(
                recipe['image'],
                width: 200.0,
                height: 200.0,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16.0),
            Text(
              'Source: ${recipe['source']}',
              style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Colors.green, // Change text color
              ),
            ),
            Text(
              'Yield: ${recipe['yield']} servings',
              style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Colors.orange, // Change text color
              ),
            ),
            Text(
              'Calories: ${recipe['calories']} kcal',
              style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Colors.red, // Change text color
              ),
            ),
            Text(
              'Total Weight: ${recipe['totalWeight']} g',
              style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Colors.blue, // Change text color
              ),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Ingredients:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            Column(
              children: [
                for (var i = 0; i < (recipe['ingredients'] as List).length; i++)
                  _buildIngredientCard(i + 1, recipe['ingredients'][i]),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIngredientCard(int index, Map<String, dynamic> ingredient) {
    final text = ingredient['text'];
    final quantity = ingredient['quantity'];
    final measure = ingredient['measure'];
    final food = ingredient['food'];
    final weight = ingredient['weight'];
    final foodCategory = ingredient['foodCategory'];
    final image = ingredient['image'];

    return Card(
      margin: const EdgeInsets.only(bottom: 16.0),
      elevation: 5.0, // Add elevation to the card
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Ingredient $index:',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
            Text('Text: $text'),
            const SizedBox(height: 8.0),
            Text('Quantity: $quantity $measure'),
            Text('Food: $food'),
            Text('Weight: $weight g'),
            Text('Food Category: $foodCategory'),
            const SizedBox(height: 8.0),
            Image.network(
              image,
              width: 100.0,
              height: 100.0,
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }
}
