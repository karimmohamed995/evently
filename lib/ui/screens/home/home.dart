import 'package:evently/ui/screens/home/tabs/favourite/favorite_tab.dart';
import 'package:evently/ui/screens/home/tabs/home/home_tab.dart';
import 'package:evently/ui/screens/home/tabs/map/map_tab.dart';
import 'package:evently/ui/screens/home/tabs/profile/profile_tab.dart';
import 'package:evently/ui/utilities/app_assets.dart';
import 'package:evently/ui/utilities/app_colors.dart';
import 'package:evently/ui/utilities/app_routes.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 0;
  List<Widget> tabs = [
    const HomeTab(),
    const MapTab(),
    const FavoriteTab(),
    const ProfileTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      // bottom: false,
      child: Scaffold(
        body: tabs[currentIndex],
        floatingActionButton: buildFab(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: buildButtomNavigationBar(),
      ),
    );
  }

  buildFab() => FloatingActionButton(
    backgroundColor: AppColors.purple,
    shape: StadiumBorder(side: BorderSide(color: Colors.white, width: 3)),
    onPressed: () {
      Navigator.push(context, AppRoutes.addEvent);
    },
    child: Icon(Icons.add),
  );

  buildButtomNavigationBar() => Theme(
    data: Theme.of(context).copyWith(canvasColor: AppColors.purple),
    child: BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (index) {
        currentIndex = index;
        setState(() {});
      },
      items: [
        BottomNavigationBarItem(
          icon: ImageIcon(
            AssetImage(
              currentIndex == 0 ? AppAssets.homeActive : AppAssets.homeIc,
            ),
          ),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(
            AssetImage(
              currentIndex == 1 ? AppAssets.mapActive : AppAssets.mapIc,
            ),
          ),
          label: "Map",
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(
            AssetImage(
              currentIndex == 2 ? AppAssets.heartActive : AppAssets.heartIc,
            ),
          ),
          label: "Favourite",
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(
            AssetImage(
              currentIndex == 3 ? AppAssets.userActive : AppAssets.userIc,
            ),
          ),
          label: "Profile",
        ),
      ],
    ),
  );
}
