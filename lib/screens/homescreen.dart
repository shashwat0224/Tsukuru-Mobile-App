import 'package:flutter/material.dart';
import 'package:tsukuru/widgets/recipes_gridview.dart';
import 'package:tsukuru/widgets/uihelper.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 8),
              SizedBox(
                height: 200,
                width: 200,
                child: UiHelper.customImage(img: 'hero-img.png'),
              ),
              SizedBox(height: 8),
              UiHelper.customText(
                title: 'CRAFTING CRAVINGS, ONE CLICK AWAY',
                size: 26,
                color: Color(0XFFB53145),
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: UiHelper.customText(
                      title: "Start Cookin'",
                      size: 16,
                      color: Colors.white,
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0XFFB53145),
                    ),
                  ),
                  SizedBox(width: 5),
                  ElevatedButton(
                    onPressed: () {},
                    child: UiHelper.customText(
                      title: "Explore Recipes",
                      size: 16,
                      color: Colors.white,
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0XFFB53145),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5),
              Divider(
                color: Colors.black,
                indent: 18,
                endIndent: 18,
                thickness: 2,
              ),
              Row(
                children: [
                  SizedBox(width: 24),
                  UiHelper.customText(
                    title: 'TRENDING RECIPES',
                    size: 24,
                    color: Color(0XFFB53145),
                  ),
                ],
              ),
              RecipesGridview(count: 10),
            ],
          ),
        ),
      ),
    );
  }
}
