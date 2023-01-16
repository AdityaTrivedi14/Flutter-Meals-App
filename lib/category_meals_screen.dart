import 'package:flutter/material.dart';

class CategoryMealScreen extends StatelessWidget {
  static const routeName = '/category-meals';
  // const CategoryMealScreen({super.key});

  // final String categoryId;
  // final String categoryTitle;

  // CategoryMealScreen(this.categoryId, this.categoryTitle);

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['title']!;
    final categoryid = routeArgs['id'];
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: const Center(
        child: Text('The Recipes For The Category!'),
      ),
    );
  }
}
