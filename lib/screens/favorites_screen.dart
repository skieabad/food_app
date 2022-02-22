import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/food_item.dart';
import '../models/food.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Food> favoriteFood;

  const FavoritesScreen({
    Key key,
    this.favoriteFood,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (favoriteFood.isEmpty) {
      return Center(
        child: Text(
          'No favorites list',
          style: GoogleFonts.lato(fontSize: 18),
        ),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return FoodItem(
            id: favoriteFood[index].id,
            title: favoriteFood[index].title,
            imageUrl: favoriteFood[index].imageUrl,
            duration: favoriteFood[index].duration,
            complexity: favoriteFood[index].complexity,
            affordable: favoriteFood[index].affordability,
          );
        },
        itemCount: favoriteFood.length,
      );
    }
  }
}
