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
              bottomLeft: Radius.circular(AppSize.s100),
              bottomRight: Radius.circular(AppSize.s100)),
          color: lightColorScheme.primary,
        ),
        padding: const EdgeInsets.symmetric(
            horizontal: AppPadding.p24, vertical: AppPadding.p8),
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
        height: AppSize.s50,
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
        height: (MediaQuery.of(context).size.height - 150) * 0.95,
        child: TabBarView(
          physics: const NeverScrollableScrollPhysics(),
          children: [
            // ? Cookies section
            _gridSection(),

            // ? cookie cake section
            _gridSection(),

            // ? cookie icecreame section
            _gridSection(),
          ],
        ),
      );
    },
  );
}

Widget _gridSection() {
  return LayoutBuilder(
    builder: (BuildContext context, BoxConstraints constraints) {
      return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.67,
        ),
        itemCount:
            20, // !adjust this count as needed => the count gonna be the lenght of array of data taht been fetch from the api
        itemBuilder: (BuildContext context, int index) {
          // ? building a grid item
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppSize.s20),
              color: lightColorScheme.onInverseSurface,
            ),
            margin: const EdgeInsets.symmetric(
                vertical: AppMargin.m10, horizontal: AppMargin.m8),
            child: _itemCard(index),
          );
        },
      );
    },
  );
}

Widget _itemCard(int index) {
  return Builder(
    builder: (context) {
      return Column(
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // * favorite section
          Container(
            margin: const EdgeInsets.all(AppMargin.m10),
            child: Align(
              alignment: Alignment.centerRight, // Align the icon to the right
              child: Icon(
                Icons.favorite_border_outlined,
                color: lightColorScheme.primary,
              ),
            ),
          ),
          //* image section
          Container(
            width: AppSize.s100,
            height: AppSize.s100,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(AppSize.s12)),
              image: DecorationImage(
                  image: NetworkImage(
                    "https://img.freepik.com/free-photo/chocolate-chip-cookies-isolated-white-background-ai-generative_123827-24066.jpg?w=1380&t=st=1697097232~exp=1697097832~hmac=442ffe62032628b889bb8214b1fac9ef1eb016583b3c545b6bd0ef8df4f4076b",
                  ),
                  // AssetImage(ImageAssets.homePagenewCookie1),
                  fit: BoxFit.cover,
                  colorFilter:
                      ColorFilter.mode(Colors.white, BlendMode.dstATop)),
            ),
          ),

          // * price section
          Container(
            padding: const EdgeInsets.only(top: AppPadding.p8),
            child: Text(
              '\$5.99',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),

          // * product name section
          Text(
            "Cookie Mint $index",
            style: Theme.of(context).textTheme.headlineMedium,
          ),

          // * add to cart section
          Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius:
                  const BorderRadius.all(Radius.circular(AppSize.s10)),
              onTap: () {},
              child: Container(
                width: AppSize.s150,
                decoration: BoxDecoration(
                  border: BorderDirectional(
                    top: BorderSide(
                        color: lightColorScheme.outline, width: AppSize.s0_5),
                  ),
                ),
                margin: const EdgeInsets.only(top: AppMargin.m8),
                padding: const EdgeInsets.all(AppPadding.p12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.add_shopping_cart_rounded,
                      color: lightColorScheme.primary,
                    ),
                    Text(
                      'add to cart',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      );
    },
  );
}
