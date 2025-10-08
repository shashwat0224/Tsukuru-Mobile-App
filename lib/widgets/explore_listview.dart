import 'package:flutter/material.dart';
import 'package:tsukuru/screens/recipescreen.dart';
import 'package:tsukuru/widgets/uihelper.dart';

class ExploreListview extends StatelessWidget {
  const ExploreListview({super.key, required this.headerTitle});

  final String headerTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        UiHelper.customHeaderText(
          title: headerTitle,
          size: 28,
          color: Colors.black,
        ),
        SizedBox(height: 8),
        SizedBox(
          height: 200,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: 8,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                //   Navigator.push(
                // context,
                // MaterialPageRoute(builder: (context) => RecipeScreen()),
              // );
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
                        UiHelper.customText(
                          title: 'Recipe Name',
                          size: 18,
                          color: Colors.black,
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
                          'qwertyuiop asdfghl zxcvbnm qwertyuiop asdfghjkl zxcvbnm qwertyuiop asdfghjkl zxcvbnm qwertyuiop asdfghjkl zxcvbnm qwertyuiop asdfghjkl zxcvbnm qwertyuiop asdfghjkl zxcvbnm qwertyuiop asdfghjkl zxcvbnm',
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
              );
            },
          ),
        ),
      ],
    );
  }
}
