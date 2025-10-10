import 'package:flutter/material.dart';
import 'package:tsukuru/api/api_func.dart';
import 'package:tsukuru/models/recipes_models.dart';
import 'package:tsukuru/widgets/explore_item.dart';
import 'package:tsukuru/widgets/uihelper.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  final ScrollController _scrollController = ScrollController();

  bool l1 = true;
  String d1 = "";
  List<Recipe> r1 = [];

  bool l2 = true;
  String d2 = "";
  List<Recipe> r2 = [];

  bool l3 = true;
  String d3 = "";
  List<Recipe> r3 = [];

  bool l4 = true;
  String d4 = "";
  List<Recipe> r4 = [];

  Future<void> _fetchData1() async {
    var record = await fetchLimitedRecipe("italian", 6);
    d1 = record.$1;
    r1 = record.$2;
    setState(() {
      l1 = false;
    });
  }

  Future<void> _fetchData2() async {
    var record = await fetchLimitedRecipe("chinese", 6);
    d2 = record.$1;
    r2 = record.$2;
    setState(() {
      l2 = false;
    });
  }

  Future<void> _fetchData3() async {
    var record = await fetchLimitedRecipe("japanese", 6);
    d3 = record.$1;
    r3 = record.$2;
    setState(() {
      l3 = false;
    });
  }

  Future<void> _fetchData4() async {
    var record = await fetchLimitedRecipe("american", 6);
    d4 = record.$1;
    r4 = record.$2;
    setState(() {
      l4 = false;
    });
  }

  @override
  void initState() {
    _fetchData1();
    _fetchData2();
    _fetchData3();
    _fetchData4();
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
          thickness: 8,
          child: SingleChildScrollView(
            controller: _scrollController,
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                UiHelper.customHeaderText(
                  title: 'Italian',
                  size: 28,
                  color: Colors.black,
                ),
                (l1)
                    ? SizedBox(
                  height: 200,
                  child: Center(
                    child: CircularProgressIndicator(color: Colors.blue),
                  ),
                )
                    : (d1 != "")
                    ? SizedBox(
                  height: 200,
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          (d1 == "No Recipes Found !")
                              ? Icons.no_meals
                              : Icons.error,
                          size: 16,
                        ),
                        UiHelper.customText(
                          title: d1,
                          size: 12,
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ],
                    ),
                  ),
                )
                    : SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ...r1.map((e) {
                        return ExploreItem(
                          title: e.title,
                          directions: e.directions,
                          id: e.id,
                          ingredients: e.ingredients,
                          image: '',
                        );
                      }),
                      Column(
                        children: [
                          SizedBox(height: 8,),
                          InkWell(
                            // onTap: () => ,
                            child: Padding(
                              padding: const EdgeInsets.all(5),
                              child: Container(
                                height: 191,
                                width: 150,
                                padding: EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.blueGrey,
                                ),
                                child: Center(
                                  child: UiHelper.customText(
                                    title: "View More ...",
                                    size: 24,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                UiHelper.customHeaderText(
                  title: 'Chinese',
                  size: 28,
                  color: Colors.black,
                ),
                (l2)
                    ? SizedBox(
                  height: 200,
                  child: Center(
                    child: CircularProgressIndicator(color: Colors.blue),
                  ),
                )
                    : (d2 != "")
                    ? SizedBox(
                  height: 200,
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          (d2 == "No Recipes Found !")
                              ? Icons.no_meals
                              : Icons.error,
                          size: 16,
                        ),
                        UiHelper.customText(
                          title: d2,
                          size: 12,
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ],
                    ),
                  ),
                )
                    : SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ...r2.map((e) {
                        return ExploreItem(
                          title: e.title,
                          directions: e.directions,
                          id: e.id,
                          ingredients: e.ingredients,
                          image: '',
                        );
                      }),
                      Column(
                        children: [
                          SizedBox(height: 8,),
                          InkWell(
                            // onTap: () => ,
                            child: Padding(
                              padding: const EdgeInsets.all(5),
                              child: Container(
                                height: 191,
                                width: 150,
                                padding: EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.blueGrey,
                                ),
                                child: Center(
                                  child: UiHelper.customText(
                                    title: "View More ...",
                                    size: 24,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                UiHelper.customHeaderText(
                  title: 'Japanese',
                  size: 28,
                  color: Colors.black,
                ),
                (l3)
                    ? SizedBox(
                  height: 200,
                  child: Center(
                    child: CircularProgressIndicator(color: Colors.blue),
                  ),
                )
                    : (d3 != "")
                    ? SizedBox(
                  height: 200,
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          (d3 == "No Recipes Found !")
                              ? Icons.no_meals
                              : Icons.error,
                          size: 16,
                        ),
                        UiHelper.customText(
                          title: d1,
                          size: 12,
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ],
                    ),
                  ),
                )
                    : SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ...r3.map((e) {
                        return ExploreItem(
                          title: e.title,
                          directions: e.directions,
                          id: e.id,
                          ingredients: e.ingredients,
                          image: '',
                        );
                      }),
                      Column(
                        children: [
                          SizedBox(height: 8,),
                          InkWell(
                            // onTap: () => ,
                            child: Padding(
                              padding: const EdgeInsets.all(5),
                              child: Container(
                                height: 191,
                                width: 150,
                                padding: EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.blueGrey,
                                ),
                                child: Center(
                                  child: UiHelper.customText(
                                    title: "View More ...",
                                    size: 24,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                UiHelper.customHeaderText(
                  title: 'American',
                  size: 28,
                  color: Colors.black,
                ),
                (l4)
                    ? SizedBox(
                  height: 200,
                  child: Center(
                    child: CircularProgressIndicator(color: Colors.blue),
                  ),
                )
                    : (d4 != "")
                    ? SizedBox(
                  height: 200,
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          (d4 == "No Recipes Found !")
                              ? Icons.no_meals
                              : Icons.error,
                          size: 16,
                        ),
                        UiHelper.customText(
                          title: d1,
                          size: 12,
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ],
                    ),
                  ),
                )
                    : SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ...r4.map((e) {
                        return ExploreItem(
                          title: e.title,
                          directions: e.directions,
                          id: e.id,
                          ingredients: e.ingredients,
                          image: '',
                        );
                      }),
                      Column(
                        children: [
                          SizedBox(height: 8,),
                          InkWell(
                            // onTap: () => ,
                            child: Padding(
                              padding: const EdgeInsets.all(5),
                              child: Container(
                                height: 191,
                                width: 150,
                                padding: EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.blueGrey,
                                ),
                                child: Center(
                                  child: UiHelper.customText(
                                    title: "View More ...",
                                    size: 24,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
