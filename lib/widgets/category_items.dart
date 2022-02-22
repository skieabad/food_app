import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../screens/category_food_screen.dart';

class CategoryItems extends StatelessWidget {
  final String id;
  final String title;
  final String image;

  const CategoryItems({
    Key key,
    @required this.id,
    @required this.title,
    @required this.image,
  }) : super(key: key);

  void categoryfoodscreen(BuildContext context) {
    Navigator.of(context).pushNamed(
      CategoryFoodScreen.routeName,
      arguments: {
        'id': id,
        'title': title,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => categoryfoodscreen(context),
      splashColor: Colors.black,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
          image: DecorationImage(
            image: AssetImage(image),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.6),
                borderRadius: const BorderRadius.all(
                  Radius.circular(10.0),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(12),
              child: Text(
                title,
                style: GoogleFonts.lato(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
