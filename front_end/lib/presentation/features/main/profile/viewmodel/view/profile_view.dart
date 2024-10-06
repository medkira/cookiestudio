import 'package:cookiestudio/app/app_prefs.dart';
import 'package:cookiestudio/app/di.dart';
import 'package:cookiestudio/presentation/features/main/profile/viewmodel/cubit/profile_viewmodel_cubit.dart';
import 'package:cookiestudio/presentation/resources/assets_manager.dart';
import 'package:cookiestudio/presentation/resources/routes_manager.dart';
import 'package:cookiestudio/presentation/resources/strings_manager.dart';
import 'package:cookiestudio/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final ProfileViewmodelCubit profileViewmodel = ProfileViewmodelCubit();
  final AppPreferences _appPreferences = instance<AppPreferences>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => profileViewmodel,
      child: BlocListener<ProfileViewmodelCubit, ProfileViewmodelState>(
        listener: (context, state) {
          if (state is LougoutSuccess) {
            _appPreferences.setUserLoggedOut();
            Navigator.pushNamed(context, Routes.loginRoute);
          }
        },
        child: _getContentWidget(),
      ),
    );
  }
}

Widget _getContentWidget() {
  return Scaffold(
    body: Column(
      children: [
        _profileSection(),
        Expanded(
          child: Align(
            alignment: Alignment.center,
            child: _logoutButton(),
          ),
        ),
      ],
    ),
  );
}

Widget _logoutButton() {
  // print("_loginButton rebuild");

  return BlocBuilder<ProfileViewmodelCubit, ProfileViewmodelState>(
    builder: (context, state) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppPadding.p14),
        child: SizedBox(
          height: AppSize.s54,
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              if (state is! LougoutLoading) {
                context.read<ProfileViewmodelCubit>().lougout();
              }
            },
            child: (state is LougoutLoading)
                ? const SizedBox(
                    height: AppSize.s24,
                    width: AppSize.s24,
                    child: CircularProgressIndicator())
                : const Text(AppStrings.logout),
          ),
        ),
      );
    },
  );
}

Widget _profileSection() {
  return Container(
    padding: EdgeInsets.all(16.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 50.0,
          backgroundImage: AssetImage(
              ImageAssets.mainLogo), // Add your profile picture asset
        ),
        SizedBox(height: 16.0),
        Text(
          'John Doe', // Replace with the user's name
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8.0),
        Text(
          'Software Developer', // Replace with a brief description or user role
          style: TextStyle(
            fontSize: 16.0,
            color: Colors.grey,
          ),
        ),
        SizedBox(height: 16.0),
        // Add additional information or actions here as needed
      ],
    ),
  );
}
