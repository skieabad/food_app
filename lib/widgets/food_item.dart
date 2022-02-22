import 'package:flutter/material.dart';
import '../models/food.dart';
import '../screens/food_details_screen.dart';

class FoodItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordable;

  const FoodItem({
    Key key,
    @required this.id,
    @required this.title,
    @required this.imageUrl,
    @required this.duration,
    @required this.complexity,
    @required this.affordable,
  }) : super(key: key);

  void selectedFood(BuildContext context) {
    Navigator.of(context)
        .pushNamed(
      FoodDetailsScreen.routeName,
      arguments: id,
    )
        .then((value) {
      if (value != null) {
        print(value);
      }
    });
  }

  String get complexityText {
    switch (complexity) {
      case Complexity.easy:
        return 'Easy';
        break;
      case Complexity.medium:
        return 'Medium';
        break;
      case Complexity.hard:
        return 'Hard';
        break;
      default:
        return throw Exception('This type doesn\'t exist');
    }
  }

  String get affordableText {
    switch (affordable) {
      case Affordability.affordable:
        return 'Affordable';
        break;
      case Affordability.pricey:
        return 'Pricey';
        break;
      case Affordability.luxurious:
        return 'Luxurious';
        break;
      default:
        return throw Exception('This type doesn\'t exist');
    }
  }

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(
      color: Colors.black,
      fontSize: 12,
      fontWeight: FontWeight.w500,
    );

    return InkWell(
      onTap: () => selectedFood(context),
      borderRadius: BorderRadius.circular(15),
      child: Card(
        margin: const EdgeInsets.all(20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 2,
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 200,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 0,
                  child: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                      ),
                      color: Colors.black54,
                    ),
                    width: 220,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child: Text(
                      title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 12,
                bottom: 12,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.schedule,
                        size: 20,
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                        '$duration min',
                        style: textStyle,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.bookmark_outline,
                        size: 20,
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                        complexityText,
                        style: textStyle,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.attach_money,
                        size: 20,
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                        affordableText,
                        style: textStyle,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
