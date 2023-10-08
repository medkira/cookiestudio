import 'package:cookiestudio/presentation/features/main/home/viewmodel/cubit/home_viewmodel_cubit.dart';
import 'package:cookiestudio/presentation/resources/color_manager.dart';
import 'package:cookiestudio/presentation/resources/strings_manager.dart';
import 'package:cookiestudio/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: _getContentWidget(),
    );
  }
}

Widget _getContentWidget() {
  return SingleChildScrollView(
    child: Column(
      children: [
        _topSectionBar(),
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
        child: _searchbar(),
      );
    },
  );
}

Widget _searchbar() {
  return Builder(
    builder: (context) {
      return TextField(
        // onChanged: (value) =>
        //     context.read<HomeViewmodelCubit>().setUserSearch(value),
        // controller: context.read<HomeViewmodelCubit>().searchBarController,
        style:
            TextStyle(fontSize: AppSize.s20, color: lightColorScheme.primary),
        decoration: InputDecoration(
          fillColor: lightColorScheme.background,
          filled: true,
          hintText: AppStrings.enterSearch,
          suffixIcon: const Icon(Icons.search),
        ),
      );
    },
  );
}
