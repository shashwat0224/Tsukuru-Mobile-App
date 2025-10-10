import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tsukuru/api/api_func.dart';
import 'package:tsukuru/core/providers/navigation_provider.dart';
import 'package:tsukuru/models/recipes_models.dart';
import 'package:tsukuru/widgets/recipes_item.dart';
import 'package:tsukuru/widgets/uihelper.dart';
import 'dart:math';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();
  bool isLoading = true;
  String detail = "";
  List<Recipe> result = [];
  List<String> trending = [
    'rice',
    'chicken',
    'pasta',
    'egg',
    'noodles',
    'bacon',
    'chickpeas',
    'potato',
    'pizza',
    'milkshake'
  ];
  int random = Random().nextInt(10);

  Future<void> _fetchData() async {
    var record = await fetchLimitedRecipe(trending[random], 5);
    detail = record.$1;
    result = record.$2;
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    _fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Scrollbar(
          controller: _scrollController,
          thumbVisibility: true,
          interactive: true,
          thickness: 6,
          child: SingleChildScrollView(
            controller: _scrollController,
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
                (isLoading)
                    ? Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 40),
                    CircularProgressIndicator(color: Colors.blue),
                  ],
                )
                    : (detail != "")
                    ? Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 30),
                    Icon(
                      (detail == "No Recipes Found !")
                          ? Icons.no_meals
                          : Icons.error,
                      size: 100,
                    ),
                    UiHelper.customText(
                      title: detail,
                      size: 36,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                )
                    : Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ...result.map((e) {
                      // print(e.ingredients);
                      return RecipesItem(
                        title: e.title,
                        directions: e.directions,
                        id: e.id,
                        ingredients: e.ingredients,
                        image: '',
                      );
                    }),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
