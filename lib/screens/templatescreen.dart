import 'package:flutter/material.dart';
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
  int currentIndex = 0;
  List<Widget> pages = [HomeScreen(),SearchScreen(),ExploreScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: UiHelper.customText(title: 'つくる', size: 22, color: Colors.white),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Color(0XFFB53145),
      ),
      body: SafeArea(child: IndexedStack(index: currentIndex, children: pages)),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: 'Explore'),
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        elevation: 1.0,
        enableFeedback: true,
        backgroundColor: Color(0XFF98AA8D),
        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.black,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
      drawer: CustomSidebar(),
    );
  }
}
