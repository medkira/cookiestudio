import 'package:cookiestudio/presentation/features/main/home/view/home_view.dart';
import 'package:cookiestudio/presentation/features/main/profile/profile_view.dart';
import 'package:cookiestudio/presentation/features/main/search/search_view.dart';
import 'package:cookiestudio/presentation/features/main/settings/settings_view.dart';
import 'package:cookiestudio/presentation/resources/color_manager.dart';
import 'package:cookiestudio/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';

import '../../resources/strings_manager.dart';

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
    const ProfileView(),
    const SettingsView(),
  ];
  List<String> titles = [
    AppStrings.home,
    AppStrings.search,
    AppStrings.profile,
    AppStrings.settings,
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
            horizontal: AppMargin.m12, vertical: AppMargin.m26),
        height: AppSize.s70,
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(AppSize.s32)),
          child: Theme(
            data: ThemeData(
              splashColor: Colors.transparent,
            ),
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              backgroundColor: lightColorScheme.secondary,
              elevation: AppSize.s12,
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: "home"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.search), label: "search"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.account_box), label: "profile"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.settings), label: "settings"),
              ],
              selectedItemColor: lightColorScheme.onSecondary,
              currentIndex: _selectedTab,
              onTap: (index) => _changeTab(index),
            ),
          ),
        ),
      ),
      body: pages[_selectedTab],
    );
  }
}
