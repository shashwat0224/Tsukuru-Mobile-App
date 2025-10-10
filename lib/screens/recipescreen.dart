import 'package:flutter/material.dart';
import 'package:tsukuru/widgets/status_snackbar.dart';
import 'package:tsukuru/widgets/uihelper.dart';

class RecipeScreen extends StatelessWidget {
  const RecipeScreen({
    super.key,
    required this.id,
    required this.title,
    required this.ingredients,
    required this.directions,
    required this.image,
  });

  final int id;
  final String title;
  final List<String> ingredients;
  final String directions;
  final String image;

  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = ScrollController();

    List<Widget> ingredientsList = ingredients.map((ingredient) {
      // print(ingredients);
      // print(ingredient);
      return SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 8.0,
          children: [
            Text(
              '•',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: Text(
                ingredient,
                style: TextStyle(
                  fontFamily: 'Merriweather',
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
                textAlign: TextAlign.left,
              ),
            ),
          ],
        ),
      );
    }).toList();

    return Scaffold(
      // backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Color(0XFFB53145),
        title: UiHelper.customText(title: 'つくる', size: 22, color: Colors.white),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
        actions: [
          IconButton(
            onPressed: () {
              SnackbarService.show('Added to Favourites', Colors.grey);
            },
            icon: Icon(Icons.download_rounded),
          ),
          IconButton(
            onPressed: () {
              SnackbarService.show('Added to Favourites', Colors.grey);
            },
            icon: Icon(Icons.favorite),
          ),
        ],
      ),
      body: SafeArea(
        child: Scrollbar(
          controller: scrollController,
          thumbVisibility: true,
          interactive: true,
          thickness: 6,
          child: SingleChildScrollView(
            controller: scrollController,
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                UiHelper.customText(
                    title: title, size: 36, color: Colors.black),
                Divider(
                  color: Colors.black,
                  thickness: 3,
                  indent: 8,
                  endIndent: 8,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 12.0),
                  child: UiHelper.customImage(
                    img:
                    'chocolate-custard-tartlets-in-almond-cookie-crust-with-saffron-ice-cream-232861.jpg',
                  ),
                ),
                Row(
                  children: [
                    UiHelper.customText(
                      title: 'Ingredients ➣',
                      size: 28,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                      fontFamily: 'Alata',
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: ingredientsList,
                ),
                SizedBox(height: 4.0),
                Row(
                  children: [
                    UiHelper.customText(
                      title: 'Directions ➣',
                      size: 28,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                      fontFamily: 'Alata',
                    ),
                  ],
                ),
                SizedBox(height: 8.0),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        directions,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Merriweather',
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
