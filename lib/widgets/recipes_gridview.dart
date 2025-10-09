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
      child: ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
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
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: Container(
                height: 175,
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
                    Row(
                      spacing: 12,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 120,
                          width: 180,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.white,
                          ),
                          child: UiHelper.customImage(img: 'hero-img.png'),
                        ),
                        Expanded(
                          child: Text(
                            directions,
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
