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
      return SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 8.0,
          children: [
            Text(
              '•',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: Text(
                ingredient,
                style: TextStyle(
                  fontFamily: 'Merriweather',
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
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
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.download_rounded)),IconButton(onPressed: () {}, icon: Icon(Icons.favorite)),],
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
                      '''Combine cream and saffron in custard cup. Place in microwave oven and heat on high until cream is hot, about 30 seconds. Remove cup from microwave and let mixture steep at room temperature 1 hour. Place ice cream in medium bowl; add saffron mixture and stir with rubber spatula until well blended. Spoon ice cream into container; cover and freeze until firm, at least 6 hours and up to 3 days.
              Bring milk to simmer in heavy medium saucepan. Remove from heat; add chocolate and stir until melted and smooth. Cool 5 minutes.
              Whisk sugar and cornstarch in medium bowl to blend. Add yolks; whisk until blended (mixture will be thick). Gradually whisk warm chocolate mixture into yolk mixture until smooth. Return mixture to saucepan. Whisk constantly over medium heat until mixture thickens and starts to bubble, about 5 minutes. Remove from heat (mixture may look grainy; whisk vigorously until smooth). Whisk in butter and vanilla. Transfer pastry cream to bowl. Let cool at room temperature until lukewarm, stirring occasionally, about 20 minutes. Cover with plastic wrap and chill overnight. (Can be prepared 2 days ahead. Keep chilled.)
              Combine flour, almonds, sugar, and baking powder in processor; blend until almonds are very finely ground. Add butter; cut in using on/off turns until small crumbs form. Whisk cream and yolk in small bowl to blend; add to processor and blend just until moist clumps form. Gather dough together; divide dough into 6 equal pieces. Form each piece into ball. Press 1 dough ball evenly onto bottom and up sides of each of six 4 1/2-inch-diameter tartlet pans with removable bottoms. Trim any excess dough. Pierce crusts all over with fork. Cover and chill overnight.
              Preheat oven to 350Â°F. Bake crusts until golden and cooked through, about 25 minutes. Cool completely in pans on rack. (Can be prepared 8 hours ahead. Cover and store at room temperature.)
              Divide pastry cream among crusts (about scant 1/3 cup for each); spread evenly. Remove tartlet pan sides. Place 1 tartlet on each of 6 plates. Top with scoop of saffron ice cream. Garnish with mint sprigs and serve.''',
                      style: TextStyle(
                        fontFamily: 'Merriweather',
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
