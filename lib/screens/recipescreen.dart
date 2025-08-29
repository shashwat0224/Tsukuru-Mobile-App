import 'package:flutter/material.dart';
import 'package:tsukuru/widgets/uihelper.dart';

class RecipeScreen extends StatelessWidget {
  const RecipeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> ingredients = [
      '3 tablespoons whipping cream',
      '1/4 teaspoon crushed saffron threads',
      '1 1/2 pints vanilla ice cream, slightly softened',
      '1 1/3 cups whole milk',
      '5 ounces bittersweet or semisweet chocolate, chopped',
      '6 tablespoons sugar',
      '2 tablespoons plus 2 teaspoons cornstarch',
      '3 large egg yolks',
      '1 tablespoon unsalted butter',
      '3/4 teaspoon vanilla extract',
      '1 1/4 cups all-purpose flour',
      '1/2 cup blanched slivered almonds',
      '2 1/2 tablespoons sugar',
      '1/2 teaspoon (generous) baking powder',
      '1/2 cup (1 stick) chilled unsalted butter, cut into 1/2-inch cubes',
      '2 tablespoons whipping cream',
      '1 large egg yolk',
      'Fresh mint sprigs',
    ];

    List<Widget> ingredientsList = ingredients.map((ingredient) {
      return Text(
        ingredient,
        style: TextStyle(
          fontSize: 16,
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontFamily: 'Raleway',
        ),
        textAlign: TextAlign.left,
      );
    }).toList();

    return Scaffold(
      // backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Color(0XFFB53145),
        title: UiHelper.customText(title: 'つくる', size: 22, color: Colors.white),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              UiHelper.customText(
                title:
                    'Chocolate Custard Tartlets in Almond Cookie Crust with Saffron Ice Cream',
                size: 36,
                color: Colors.black,
              ),
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
                    size: 22,
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
            ],
          ),
        ),
      ),
    );
  }
}
