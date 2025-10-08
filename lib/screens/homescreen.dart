import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tsukuru/core/providers/navigation_provider.dart';
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
            children: [
              SizedBox(height: 8),
              SizedBox(
                height: 200,
                width: 200,
                child: UiHelper.customImage(img: 'hero-img.png'),
              ),
              SizedBox(height: 8),
              UiHelper.customText(
                title: 'CRAFTING CRAVINGS,\nONE CLICK AWAY',
                size: 26,
                color: Color(0XFFB53145),
                fontFamily: 'Alata',
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      context.read<NaviagtionProvider>().setIndex(1);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0XFFB53145),
                    ),
                    child: UiHelper.customText(
                      title: "Start Cookin'",
                      size: 16,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: 5),
                  ElevatedButton(
                    onPressed: () {
                      context.read<NaviagtionProvider>().setIndex(2);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0XFFB53145),
                    ),
                    child: UiHelper.customText(
                      title: "Explore Recipes",
                      size: 16,
                      color: Colors.white,
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
                    fontFamily: 'Alata',
                  ),
                ],
              ),
              RecipesGridview(count: 8,title: 'title',directions: 'directions', id: 1, ingredients: [], image: '',),
            ],
          ),
        ),
      ),
    );
  }
}
