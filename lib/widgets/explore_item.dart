import 'package:flutter/material.dart';
import 'package:tsukuru/screens/recipescreen.dart';
import 'package:tsukuru/widgets/uihelper.dart';

class ExploreItem extends StatelessWidget {
  const ExploreItem({
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
    return Column(
      children: [
        SizedBox(height: 8),
        SizedBox(
          height: 200,
          child: InkWell(
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
            //   print('onDoubleTap');
            // },
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: Container(
                width: 150,
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
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Alata',
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    SizedBox(height: 8),
                    Container(
                      height: 90,
                      width: 140,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white,
                      ),
                      child: UiHelper.customImage(img: 'hero-img.png'),
                    ),
                    SizedBox(height: 8),
                    Text(
                      directions,
                      style: TextStyle(
                        fontFamily: "AmaticSC",
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        color: Color(0XFFEDE490),
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
