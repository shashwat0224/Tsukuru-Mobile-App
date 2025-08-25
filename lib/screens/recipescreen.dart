import 'package:flutter/material.dart';
import 'package:tsukuru/widgets/uihelper.dart';

class RecipeScreen extends StatelessWidget {
  const RecipeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Color(0XFFB53145),
        title: UiHelper.customText(title: 'つくる', size: 22, color: Colors.white),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              UiHelper.customText(
                title: 'Recipe Details',
                size: 54,
                color: Colors.black,
              ),
              Divider(
                color: Colors.black,
                thickness: 3,
                indent: 8,
                endIndent: 8,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
