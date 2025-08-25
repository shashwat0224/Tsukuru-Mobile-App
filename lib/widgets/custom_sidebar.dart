import 'package:flutter/material.dart';
import 'package:tsukuru/widgets/uihelper.dart';

class CustomSidebar extends StatelessWidget {
  const CustomSidebar({super.key});

  @override
  Widget build(BuildContext context) {
    bool value = false;

    List<Widget> drawerHeaderSignedIn = [
      CircleAvatar(child: UiHelper.customImage(img: 'pfp.png'), radius: 34),
      SizedBox(height: 3),
      UiHelper.customText(title: 'Username', size: 22, color: Colors.black),
      UiHelper.customText(
        title: 'username@example.com',
        size: 16,
        color: Colors.black,
      ),
    ];
    List<Widget> drawerHeaderSignedOut = [
      UiHelper.customText(
        title: 'Want to Add Recipes to',
        size: 22,
        color: Colors.black,
      ),
      UiHelper.customText(
        title: 'favourites, Save Recipes',
        size: 22,
        color: Colors.black,
      ),
      UiHelper.customText(title: 'on Device', size: 22, color: Colors.black),
      ElevatedButton(
        onPressed: () {},
        child: UiHelper.customText(
          title: 'Login Now!',
          size: 16,
          color: Colors.white,
        ),
        style: ElevatedButton.styleFrom(backgroundColor: Color(0XFF98AA8D)),
      ),
    ];

    return SafeArea(
      child: Drawer(
        width: MediaQuery.of(context).size.width * 0.69,
        backgroundColor: const Color(0XFFB53145),
        surfaceTintColor: Colors.white,
        child: ListView(
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
              decoration: const BoxDecoration(color: Colors.white),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: (value)
                    ? drawerHeaderSignedOut
                    : drawerHeaderSignedIn,
              ),
            ),
            ListTile(
              leading: const Icon(Icons.person, color: Colors.white),
              title: UiHelper.customText(
                title: 'Profile',
                size: 20,
                color: Colors.white,
              ),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.settings, color: Colors.white),
              title: UiHelper.customText(
                title: 'Settings',
                size: 20,
                color: Colors.white,
              ),
              onTap: () {},
            ),
            // ListTile(
            //   leading: Icon(Icons.save_alt, color: Colors.white),
            //   title: UiHelper.customText(
            //     title: 'Saved',
            //     size: 20,
            //     color: Colors.white,
            //   ),
            //   onTap: () {},
            // ),
            ListTile(
              leading: const Icon(Icons.favorite, color: Colors.white),
              title: UiHelper.customText(
                title: 'Favourites',
                size: 20,
                color: Colors.white,
              ),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.info, color: Colors.white),
              title: UiHelper.customText(
                title: 'About Us',
                size: 20,
                color: Colors.white,
              ),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.help, color: Colors.white),
              title: UiHelper.customText(
                title: 'Help & Support',
                size: 20,
                color: Colors.white,
              ),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
