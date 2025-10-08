import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tsukuru/core/providers/navigation_provider.dart';
import 'package:tsukuru/screens/explorescreen.dart';
import 'package:tsukuru/screens/searchscreen.dart';
import 'package:tsukuru/widgets/custom_sidebar.dart';
import 'package:tsukuru/screens/homescreen.dart';
import 'package:tsukuru/widgets/uihelper.dart';

class TemplateScreen extends StatefulWidget {
  const TemplateScreen({super.key});

  @override
  State<TemplateScreen> createState() => _TemplateScreenState();
}

class _TemplateScreenState extends State<TemplateScreen> {
  List<Widget> pages = [HomeScreen(), SearchScreen(), ExploreScreen()];

  // bool isloading(int status) {
  //   if (status == 200) {
  //     return true;
  //   } else {
  //     return false;
  //   }
  // }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: UiHelper.customText(
          title: 'つくる',
          size: 22,
          color: Colors.white,
          fontFamily: 'Raleway',
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: const Color(0XFFB53145),
      ),
      body: SafeArea(
        child: IndexedStack(
          index: context.watch<NaviagtionProvider>().selectedIndex,
          children: pages,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: 'Explore'),
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: context.watch<NaviagtionProvider>().selectedIndex,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        elevation: 1.0,
        enableFeedback: true,
        backgroundColor: const Color(0XFF98AA8D),
        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.black,
        onTap: (index) {
          setState(() {
            context.read<NaviagtionProvider>().setIndex(index);
          });
        },
      ),
      drawer: CustomSidebar(),
    );
  }
}
