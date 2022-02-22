import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:google_fonts/google_fonts.dart';

import '../data/category_data.dart';
import '../widgets/text_header_main.dart';
import '../widgets/text_output_main.dart';

class FoodDetailsScreen extends StatelessWidget {
  final Function toogleFavorite;
  final Function isFoodFavorite;

  const FoodDetailsScreen({
    Key key,
    this.toogleFavorite,
    this.isFoodFavorite,
  }) : super(key: key);

  static const routeName = '/food-details-screen';

  @override
  Widget build(BuildContext context) {
    final foodID = ModalRoute.of(context).settings.arguments as String;
    final selectedFood = dummyFood.firstWhere((food) => food.id == foodID);

    final appBar = AppBar(
      leading: IconButton(
        onPressed: () => Navigator.of(context).pop(),
        icon: const Icon(Icons.arrow_back_ios_outlined),
      ),
      // ignore: unnecessary_string_interpolations
      title: Text(
        // ignore: unnecessary_string_interpolations
        '${selectedFood.title}',
        style: Theme.of(context).textTheme.headline3,
      ),
      iconTheme: const IconThemeData(color: Colors.black),
    );

    final textStyle = GoogleFonts.roboto(
      fontSize: 14,
      color: Colors.black,
    );

    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 12),
              height: MediaQuery.of(context).size.height - 409,
              width: double.infinity,
              child: Image.network(
                selectedFood.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            const TextHeaderMain(
              text: 'Ingredients',
            ),
            const SizedBox(height: 4),
            TextOutputMain(
              child: ListView.builder(
                itemBuilder: (ctx, index) {
                  return Column(
                    children: [
                      Card(
                        elevation: 0,
                        child: Text(
                          selectedFood.ingredients[index],
                          style: textStyle,
                        ),
                      ),
                      const Divider(
                        indent: 30,
                        endIndent: 30,
                        color: Colors.grey,
                      ),
                    ],
                  );
                },
                itemCount: selectedFood.ingredients.length,
              ),
            ),
            const TextHeaderMain(
              text: 'Steps',
            ),
            const SizedBox(height: 4),
            TextOutputMain(
              child: ListView.builder(
                itemBuilder: (ctx, index) {
                  return Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.black,
                          child: Text(
                            '${index + 1}',
                            style: GoogleFonts.roboto(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        title: Text(
                          selectedFood.steps[index],
                          style: textStyle,
                        ),
                      ),
                      const Divider(
                        indent: 10,
                        endIndent: 10,
                        color: Colors.grey,
                      ),
                    ],
                  );
                },
                itemCount: selectedFood.steps.length,
              ),
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        child: Icon(
          isFoodFavorite(foodID) ? Icons.favorite : Icons.favorite_border,
        ),
        // onPressed: () {
        //   Navigator.of(context).pop(foodID);
        // },
        onPressed: () {
          toogleFavorite(foodID);
          isFoodFavorite(foodID)
              ? showToast("Add to favorites", context: context)
              : showToast("Removed to favorites", context: context);
        },
      ),
    );
  }
}
