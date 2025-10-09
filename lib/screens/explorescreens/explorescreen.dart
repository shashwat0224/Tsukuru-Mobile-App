import 'package:flutter/material.dart';
import 'package:tsukuru/widgets/explore_listview.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              ExploreListview(headerTitle: 'Italian'),
              ExploreListview(headerTitle: 'Chinese'),
              ExploreListview(headerTitle: 'South Indian'),
            ],
          ),
        ),
      ),
    );
  }
}
