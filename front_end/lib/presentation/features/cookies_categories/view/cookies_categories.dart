import 'package:cookiestudio/presentation/resources/assets_manager.dart';
import 'package:cookiestudio/presentation/resources/color_manager.dart';
import 'package:cookiestudio/presentation/resources/font_manager.dart';
import 'package:cookiestudio/presentation/resources/strings_manager.dart';
import 'package:cookiestudio/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';

class CookiesCategoriesView extends StatelessWidget {
  const CookiesCategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: lightColorScheme
              .onPrimary, // Change this color to your desired color
        ),
        title: const Text(AppStrings.pickup),
      ),
      body: _getContentWidget(),
    );
  }
}

Widget _getContentWidget() {
  return Column(
    children: [
      _topSectionBar(),
      _titleCategories(),
      _tabController(),
    ],
  );
}

Widget _topSectionBar() {
  return Builder(
    builder: (context) {
      return Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(AppSize.s28),
              bottomRight: Radius.circular(AppSize.s28)),
          color: lightColorScheme.primary,
        ),
        padding: const EdgeInsets.symmetric(
            horizontal: AppPadding.p24, vertical: AppPadding.p10),
        // child: _searchbar(),
      );
    },
  );
}

Widget _titleCategories() {
  return Builder(
    builder: (context) {
      return Container(
        margin: const EdgeInsets.only(top: AppMargin.m4),
        height: AppSize.s60,
        child: Row(
          children: [
            const SizedBox(width: AppSize.s20),
            Text(
              AppStrings.categories,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(fontSize: FontSize.s40),
            ),
          ],
        ),
      );
    },
  );
}

Widget _tabController() {
  return Builder(
    builder: (context) {
      return DefaultTabController(
        length: 3,
        child: Column(
          children: [
            TabBar(
              splashFactory: InkSparkle.splashFactory,
              indicatorSize: TabBarIndicatorSize.label,
              tabs: [
                Tab(
                  child: Text(
                    'Cookies',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                Tab(
                  child: Text(
                    'Cookie cake',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                Tab(
                  child: SizedBox(
                    width: AppSize.s85,
                    child: Text(
                      textAlign: TextAlign.center,
                      'Cookie icecream',
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(height: AppSize.s0_9),
                    ),
                  ),
                ),
              ],
            ),
            _tabBarView(),
          ],
        ),
      );
    },
  );
}

Widget _tabBarView() {
  return Builder(
    builder: (context) {
      return SizedBox(
        height: MediaQuery.of(context).size.height - AppSize.s228,
        child: TabBarView(
          physics: const NeverScrollableScrollPhysics(),
          children: [
            // ? Cookies section
            LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    // crossAxisSpacing: 15,
                    // mainAxisSpacing: 15,
                  ),
                  itemCount: 20, // You can adjust this count as needed
                  itemBuilder: (BuildContext context, int index) {
                    // ? building a grid item
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(AppSize.s12),
                        color: lightColorScheme.primaryContainer,
                      ),
                      margin: const EdgeInsets.only(
                          top: AppMargin.m16,
                          left: AppMargin.m16,
                          right: AppMargin.m16),
                      child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.all(AppMargin.m10),
                            child: Align(
                              alignment: Alignment
                                  .centerRight, // Align the icon to the right
                              child: Icon(
                                Icons.favorite_border_outlined,
                                color: lightColorScheme.primary,
                              ),
                            ),
                          ),
                          Container(
                            width: AppSize.s100,
                            height: AppSize.s100,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(AppSize.s12)),
                              image: DecorationImage(
                                image:
                                    AssetImage(ImageAssets.homePagenewCookie1),
                                fit: BoxFit.cover,
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                );
              },
            ),

            // ? cookie cake section
            const Center(
              child: Text("ff"),
            ),

            const Center(
              child: Text("ff"),
            ),
          ],
        ),
      );
    },
  );
}
