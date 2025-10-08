import 'package:flutter/material.dart';
import 'package:tsukuru/screens/recipescreen.dart';
import 'package:tsukuru/widgets/uihelper.dart';

class RecipesGridview extends StatelessWidget {
  const RecipesGridview({
    super.key,
    required this.count,
    required this.title,
    required this.directions,
    required this.id,
    required this.ingredients,
    required this.image,
  });

  final int count;
  final int id;
  final String title;
  final List<String> ingredients;
  final String directions;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
        itemCount: count,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RecipeScreen(
                    id: id,
                    title: title,
                    ingredients: ingredients,
                    directions: directions,
                    image: image,
                  ),
                ),
              );
            },
            // onDoubleTap: () {
            //   print('double tapped');
            // },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: Container(
                height: 210,
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.blueGrey,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Alata',
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    SizedBox(height: 8),
                    Container(
                      height: 90,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white,
                      ),
                      child: UiHelper.customImage(img: 'hero-img.png'),
                    ),
                    SizedBox(height: 8),
                    Expanded(
                      child: Text(
                        'qazwsxedc rfvtgbyhnujnm jm ijnmbv qazwsxedc rfvtgbyhnujnm jm ijnmbv qazwsxedc rfvtgbyhnujnm jm ijnmbv qazwsxedc rfvtgbyhnujnm jm ijnmbv qazwsxedc rfvtgbyhnujnm jm ijnmbv qazwsxedc rfvtgbyhnujnm jm ijnmbv ',
                        style: TextStyle(
                          fontFamily: "AmaticSC",
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          color: Color(0XFFEDE490),
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
