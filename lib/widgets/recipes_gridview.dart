import 'package:flutter/material.dart';
import 'package:tsukuru/widgets/uihelper.dart';

class RecipesGridview extends StatelessWidget {
  const RecipesGridview({super.key, required this.count});

  final int count;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
      ),
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: count,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0.0),
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
                  'qwertyuiop asdfghl zxcvbnm qwertyuiop asdfghjkl zxcvbnm qwertyuiop asdfghjkl zxcvbnm qwertyuiop asdfghjkl zxcvbnm',
                  style: TextStyle(
                    fontFamily: "AmaticSC",
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    // overflow: TextOverflow.ellipsis,
                    color: Color(0XFFEDE490),
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
