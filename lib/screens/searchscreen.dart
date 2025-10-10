import 'dart:async';
import 'package:flutter/material.dart';
import 'package:tsukuru/api/api_func.dart';
import 'package:tsukuru/models/recipes_models.dart';
import 'package:tsukuru/widgets/recipes_item.dart';
import 'package:tsukuru/widgets/uihelper.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  bool err = false;
  bool isLoading = false;
  String detail = "";
  List<Recipe> result = [];
  final List<String> _words = ['rice', 'chicken',
    'pasta', 'egg', 'noodles',
  ];
  int _index = 0;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      setState(() {});
    });
    _timer = Timer.periodic(const Duration(seconds: 2), (timer) {
      setState(() {
        _index = (_index + 1) % _words.length;
      });
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    _timer.cancel();
    super.dispose();
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
          child: SingleChildScrollView(controller: _scrollController,
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.redAccent[100],
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 4.0,
                        spreadRadius: 2.5,
                      ),
                    ],
                  ),
                  child: TextField(
                    controller: _searchController,
                    keyboardType: TextInputType.text,
                    onEditingComplete: () {
                      if (_searchController.text.contains(RegExp(
                        r"[`~!@#$%^&*()_+-=₹[]\;'',./{}|:"
                        "<>? 0123456789]",
                      ),
                      )) {
                        setState(() {
                          err = true;
                        });
                      }
                    },
                    onSubmitted: (value) async {
                      setState(() {
                        isLoading = true;
                      });
                      var record = await fetchRecipe(value.trim());
                      detail = record.$1;
                      result = record.$2;
                      setState(() {
                        isLoading = false;
                      });
                    },
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(26, 10, 2, 2),
                      hint: Row(
                        children: [
                          const Text(
                            'Search ',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.normal,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          AnimatedSwitcher(
                            duration: const Duration(milliseconds: 300),
                            transitionBuilder: (child, animation) =>
                                FadeTransition(
                                  opacity: animation,
                                  child: child,
                                ),
                            child: Text(
                              _words[_index],
                              key: ValueKey(_words[_index]),
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.normal,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ],
                      ),
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.search),
                      suffixIcon: (_searchController.text.isNotEmpty)
                          ? IconButton(
                              icon: Icon(Icons.clear),
                              onPressed: () {
                                setState(() {
                                  _searchController.clear();
                                  err = false;
                                });
                              },
                            )
                          : null,
                    ),
                  ),
                ),
                SizedBox(height: 5),
                (err)
                    ? UiHelper.customText(
                        title: "Don't use numbers or symbols",
                        size: 12,
                        color: Colors.black,
                        fontFamily: 'Merriweather',
                      )
                    : SizedBox(height: 8),
                (isLoading)
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: 169),
                          CircularProgressIndicator(color: Colors.blue),
                        ],
                      )
                    : (detail != "")
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: 169),
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
