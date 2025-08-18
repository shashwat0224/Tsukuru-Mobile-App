import 'package:flutter/material.dart';
import 'package:tsukuru/widgets/uihelper.dart';

class RecipesGridview extends StatelessWidget {
  const RecipesGridview({super.key, required this.count});

  final int count;

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
              print('tapped');
            },
            onDoubleTap: () {
              print('double tapped');
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: Container(
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
                      width: double.infinity,
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
    );
  }
}
