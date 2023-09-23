import 'package:cookiestudio/presentation/common/animation/json_animation.dart';
import 'package:cookiestudio/presentation/features/main/home/viewmodel/cubit/home_viewmodel_cubit.dart';
import 'package:cookiestudio/presentation/resources/assets_manager.dart';
import 'package:cookiestudio/presentation/resources/color_manager.dart';
import 'package:cookiestudio/presentation/resources/font_manager.dart';
import 'package:cookiestudio/presentation/resources/strings_manager.dart';
import 'package:cookiestudio/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    child: Column(
      children: [
        _userProfile(),
        _searchbar(),
        _ordersAndWish(),
        _categories(),
      ],
    ),
  );
}

Widget _userProfile() {
  return Builder(builder: (context) {
    return Container(
      color: lightColorScheme.primary,
      padding: const EdgeInsets.symmetric(
          horizontal: AppPadding.p24, vertical: AppPadding.p26),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            AppStrings.myProfile,
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          const CircleAvatar(
            maxRadius: AppSize.s35,
          )
        ],
      ),
    );
  });
}

Widget _searchbar() {
  return Builder(
    builder: (context) {
      return Container(
        padding: const EdgeInsets.symmetric(
            horizontal: AppPadding.p18, vertical: AppPadding.p28),
        child: TextField(
          onChanged: (value) =>
              context.read<HomeViewmodelCubit>().setUserSearch(value),
          controller: context.read<HomeViewmodelCubit>().searchBarController,
          style: const TextStyle(fontSize: AppSize.s20),
          decoration: const InputDecoration(
            hintText: AppStrings.enterSearch,
            suffixIcon: Icon(Icons.search),
          ),
        ),
      );
    },
  );
}

Widget _ordersAndWish() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      _ordersButton(),
      _wishButton(),
    ],
  );
}

Widget _ordersButton() {
  return Builder(builder: (context) {
    return Card(
      child: SizedBox(
        width: AppSize.s150,
        height: AppSize.s80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(
              Icons.receipt_long_outlined,
              size: AppSize.s35,
              color: lightColorScheme.primary,
            ),
            Text(
              AppStrings.myOrders,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ],
        ),
      ),
    );
  });
}

Widget _wishButton() {
  return Builder(builder: (context) {
    return Card(
      child: SizedBox(
        width: AppSize.s150,
        height: AppSize.s80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              Icons.favorite_outline,
              size: AppSize.s35,
              color: lightColorScheme.primary,
            ),
            Text(
              AppStrings.myWish,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ],
        ),
      ),
    );
  });
}

Widget _categories() {
  return Builder(builder: (context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppPadding.p18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.categories,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: AppSize.s18),
          _categoriesList(),
        ],
      ),
    );
  });
}

_categoriesList() {
  return SingleChildScrollView(
    physics: const BouncingScrollPhysics(),
    scrollDirection: Axis.horizontal,
    child: Row(
      children: [
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
      return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSize.s14),
            color: lightColorScheme.primary),
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
                    color: lightColorScheme.onPrimary, fontSize: FontSize.s24),
              ),
            ),
          ],
        ),
      );
    },
  );
}

Widget _iceCreamCard() {
  return Builder(
    builder: (context) {
      return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSize.s14),
            color: lightColorScheme.surfaceVariant),
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
                    color: lightColorScheme.primary, fontSize: FontSize.s24),
              ),
            ),
          ],
        ),
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
