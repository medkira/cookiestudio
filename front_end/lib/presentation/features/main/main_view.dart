import 'package:cookiestudio/presentation/features/main/home/view/home_view.dart';
import 'package:cookiestudio/presentation/features/main/profile/viewmodel/view/profile_view.dart';
import 'package:cookiestudio/presentation/features/main/search/search_view.dart';
import 'package:cookiestudio/presentation/features/main/shopping_bag/shopping_bag.dart';
import 'package:cookiestudio/presentation/resources/color_manager.dart';
import 'package:cookiestudio/presentation/resources/strings_manager.dart';
import 'package:cookiestudio/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int _selectedTab = 0;
  _changeTab(int index) {
    setState(() {
      _selectedTab = index;
    });
  }

  List<Widget> pages = [
    const HomeView(),
    const SearchView(),
    const SettingsView(),
    const ProfileView(),
  ];
  List<String> titles = [
    AppStrings.home,
    AppStrings.search,
    AppStrings.shoppingBag,
    AppStrings.profile,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightColorScheme.background,
      appBar: AppBar(
        title: Text(titles[_selectedTab]),
        automaticallyImplyLeading:
            false, // ! make it false when u add a Log out
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.symmetric(
            horizontal: AppMargin.m12, vertical: AppMargin.m22),
        height: AppSize.s70,
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(AppSize.s30)),
          child: Theme(
            data: ThemeData(
              splashColor: Colors.transparent,
            ),
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              backgroundColor: lightColorScheme.primary,
              elevation: AppSize.s12,
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(Icons.home_rounded, size: AppSize.s35),
                    label: "home"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.search_rounded, size: AppSize.s35),
                    label: "search"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.shopping_bag_outlined, size: AppSize.s35),
                    label: "shopping bag"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person_rounded, size: AppSize.s35),
                    label: "profile"),
              ],
              selectedItemColor: lightColorScheme.onSecondary,
              currentIndex: _selectedTab,
              onTap: (index) => _changeTab(index),
              showSelectedLabels: false,
              showUnselectedLabels: false,
            ),
          ),
        ),
      ),
      body: pages[_selectedTab],
    );
  }
}
