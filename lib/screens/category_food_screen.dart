import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/food.dart';
import '../widgets/food_item.dart';

class CategoryFoodScreen extends StatefulWidget {
  const CategoryFoodScreen({
    Key key,
    @required this.availableFood,
  }) : super(key: key);

  static const routeName = '/category-food-screen';

  final List<Food> availableFood;

  @override
  State<CategoryFoodScreen> createState() => _CategoryFoodScreenState();
}

class _CategoryFoodScreenState extends State<CategoryFoodScreen> {
  String categoryTitle;
  List<Food> displayFoods;
  var _loadInitData = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (!_loadInitData) {
      final routeArgument =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      categoryTitle = routeArgument['title'];
      final categoryId = routeArgument['id'];
      displayFoods = widget.availableFood.where((food) {
        return food.categories.contains(categoryId);
      }).toList();
      _loadInitData = true;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(
            Icons.arrow_back_ios_outlined,
            size: 20,
          ),
        ),
        title: Text(
          categoryTitle,
          style: Theme.of(context).textTheme.headline6,
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: displayFoods.isEmpty
          ? Center(
              child: Text(
                'No food available',
                style: GoogleFonts.lato(fontSize: 18),
              ),
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return FoodItem(
                  id: displayFoods[index].id,
                  title: displayFoods[index].title,
                  imageUrl: displayFoods[index].imageUrl,
                  duration: displayFoods[index].duration,
                  complexity: displayFoods[index].complexity,
                  affordable: displayFoods[index].affordability,
                );
              },
              itemCount: displayFoods.length,
            ),
    );
  }
}
