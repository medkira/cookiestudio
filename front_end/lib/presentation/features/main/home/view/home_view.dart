import 'package:cookiestudio/presentation/common/animation/json_animation.dart';
import 'package:cookiestudio/presentation/features/main/home/viewmodel/cubit/home_viewmodel_cubit.dart';
import 'package:cookiestudio/presentation/resources/assets_manager.dart';
import 'package:cookiestudio/presentation/resources/color_manager.dart';
import 'package:cookiestudio/presentation/resources/font_manager.dart';
import 'package:cookiestudio/presentation/resources/routes_manager.dart';
import 'package:cookiestudio/presentation/resources/strings_manager.dart';
import 'package:cookiestudio/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final HomeViewmodelCubit homeViewModel = HomeViewmodelCubit();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => homeViewModel,
      child: BlocBuilder<HomeViewmodelCubit, HomeViewmodelState>(
        builder: (context, state) {
          if (state is HomeViewmodelLoading) {
            return _loadingScreen();
          } else {
            return _getContentWidget();
          }
        },
      ),
    );
  }
}

Widget _getContentWidget() {
  return SingleChildScrollView(
    physics: const NeverScrollableScrollPhysics(),
    child: Column(
      children: [
        _topSectionBar(),
        // _searchbar(),
        // _ordersAndWish(),
        _newProduct(),
        _categories(),
      ],
    ),
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
            horizontal: AppPadding.p24, vertical: AppPadding.p24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              AppStrings.greetingMessage,
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            SizedBox(
              // maxRadius: AppSize.s35,
              width: AppSize.s70,
              height: AppSize.s70,
              child: Lottie.asset(JsonAssets.cookie),
            )
          ],
        ),
      );
    },
  );
}

// Widget _searchbar() {
//   return Builder(
//     builder: (context) {
//       return Container(
//         padding: const EdgeInsets.symmetric(
//             horizontal: AppPadding.p18, vertical: AppPadding.p28),
//         child: TextField(
//           onChanged: (value) =>
//               context.read<HomeViewmodelCubit>().setUserSearch(value),
//           controller: context.read<HomeViewmodelCubit>().searchBarController,
//           style: const TextStyle(fontSize: AppSize.s20),
//           decoration: const InputDecoration(
//             hintText: AppStrings.enterSearch,
//             suffixIcon: Icon(Icons.search),
//           ),
//         ),
//       );
//     },
//   );
// }

// Widget _ordersAndWish() {
//   return Container(
//     margin: const EdgeInsets.only(top: AppMargin.m10),
//     child: Row(
//       mainAxisAlignment: MainAxisAlignment.spaceAround,
//       children: [
//         _ordersButton(),
//         _wishButton(),
//       ],
//     ),
//   );
// }

// Widget _ordersButton() {
//   return Builder(builder: (context) {
//     return Card(
//       child: SizedBox(
//         width: AppSize.s150,
//         height: AppSize.s80,
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: [
//             Icon(
//               Icons.receipt_long_outlined,
//               size: AppSize.s35,
//               color: lightColorScheme.primary,
//             ),
//             Text(
//               AppStrings.myOrders,
//               style: Theme.of(context).textTheme.titleLarge,
//             ),
//           ],
//         ),
//       ),
//     );
//   });
// }

// Widget _wishButton() {
//   return Builder(builder: (context) {
//     return Card(
//       child: SizedBox(
//         width: AppSize.s150,
//         height: AppSize.s80,
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             Icon(
//               Icons.favorite_outline,
//               size: AppSize.s35,
//               color: lightColorScheme.primary,
//             ),
//             Text(
//               AppStrings.myWish,
//               style: Theme.of(context).textTheme.titleLarge,
//             ),
//           ],
//         ),
//       ),
//     );
//   });
// }

Widget _categories() {
  return Builder(
    builder: (context) {
      return Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: AppPadding.p18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const SizedBox(width: AppSize.s24),
                Text(
                  AppStrings.categories,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
            const SizedBox(height: AppSize.s14),
            _categoriesList(),
          ],
        ),
      );
    },
  );
}

_categoriesList() {
  return SingleChildScrollView(
    physics: const BouncingScrollPhysics(),
    scrollDirection: Axis.horizontal,
    child: Row(
      children: [
        const SizedBox(width: AppSize.s18),
        _cookiesCard(),
        const SizedBox(width: AppSize.s20),
        _iceCreamCard(),
      ],
    ),
  );
}

Widget _cookiesCard() {
  return Builder(
    builder: (context) {
      return Material(
        borderRadius: BorderRadius.circular(AppSize.s14),
        color: lightColorScheme.primary,
        child: InkWell(
          borderRadius: BorderRadius.circular(AppSize.s14),
          // ? we us this coockie card to navigate to cookies page
          onTap: () {
            Future.delayed(AppDurations.navigateDuration, () {
              Navigator.pushNamed(context, Routes.cookieCategories);
            });
          },
          child: SizedBox(
            width: AppSize.s200,
            height: AppSize.s145,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: AppPadding.p120),
                  child: Icon(
                    Icons.cookie_outlined,
                    size: AppSize.s54,
                    color: lightColorScheme.onPrimary,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: AppPadding.p70),
                  child: Text(
                    AppStrings.cookies,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: lightColorScheme.onPrimary,
                        fontSize: FontSize.s20),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}

Widget _iceCreamCard() {
  return Builder(
    builder: (context) {
      return Material(
        borderRadius: BorderRadius.circular(AppSize.s14),
        color: lightColorScheme.surfaceVariant,
        child: InkWell(
          borderRadius: BorderRadius.circular(AppSize.s14),
          onTap: () {},
          child: SizedBox(
            width: AppSize.s200,
            height: AppSize.s145,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: AppPadding.p120),
                  child: Icon(
                    Icons.icecream_outlined,
                    size: AppSize.s54,
                    color: lightColorScheme.primary,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: AppPadding.p70),
                  child: Text(
                    AppStrings.iceCream,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: lightColorScheme.primary,
                        fontSize: FontSize.s20),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}

// ? new product section
Widget _newProduct() {
  return Builder(
    builder: (context) {
      return Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: AppPadding.p18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const SizedBox(width: AppSize.s24),
                Text(
                  AppStrings.newCookie,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(width: AppSize.s10),
                Text(
                  AppStrings.plus,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
            const SizedBox(height: AppSize.s14),
            _newProductList(),
          ],
        ),
      );
    },
  );
}

_newProductList() {
  return SingleChildScrollView(
    physics: const BouncingScrollPhysics(),
    scrollDirection: Axis.horizontal,
    child: Row(
      children: [
        const SizedBox(width: AppSize.s18),
        _cookieCard(ImageAssets.homePagenewCookie1),
        const SizedBox(width: AppSize.s20),
        _cookieCard(ImageAssets.homePagenewCookie2),
        const SizedBox(width: AppSize.s20),
        _cookieCard(ImageAssets.homePagenewCookie1),
      ],
    ),
  );
}

Widget _cookieCard(String imagePath) {
  return Builder(
    builder: (context) {
      return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                imagePath,
              ),
              fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(AppSize.s16),
        ),
        width: AppSize.s200,
        height: AppSize.s145,
      );
    },
  );
}

Widget _loadingScreen() {
  return Builder(builder: (context) {
    return Center(
      child: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              getAnimatedImage(JsonAssets.loading),
              Text(
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineLarge,
                "Loading...",
              )
            ],
          ),
        ),
      ),
    );
  });
}
