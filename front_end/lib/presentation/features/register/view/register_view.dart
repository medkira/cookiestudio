import 'package:cookiestudio/app/app_prefs.dart';
import 'package:cookiestudio/app/di.dart';
import 'package:cookiestudio/presentation/features/register/viewmodel/cubit/register_viewmodel_cubit.dart';
import 'package:cookiestudio/presentation/resources/assets_manager.dart';
import 'package:cookiestudio/presentation/resources/color_manager.dart';
import 'package:cookiestudio/presentation/resources/form_validator_manager.dart';
import 'package:cookiestudio/presentation/resources/strings_manager.dart';
import 'package:cookiestudio/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final RegisterViewmodelCubit registerViewmodel = RegisterViewmodelCubit();
  final AppPreferences _appPreferences = instance<AppPreferences>();

  void _bind() {
    registerViewmodel.start();
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => registerViewmodel,
      child: _getContentWidget(),
    );
  }
}

Widget _getContentWidget() {
  return Scaffold(
    backgroundColor: lightColorScheme.background,
    appBar: AppBar(
      scrolledUnderElevation: AppSize.s1_5,
      toolbarHeight: AppSize.s50,
      automaticallyImplyLeading: true,
      backgroundColor: lightColorScheme.background,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: lightColorScheme.background,
      ),
    ),
    body: SingleChildScrollView(
      child: Column(
        children: [
          _logo(),
          _registerForm(),
          _registerButton(),
        ],
      ),
    ),
  );
}

Widget _logo() {
  return const Padding(
    padding: EdgeInsets.only(top: AppSize.s10, bottom: AppSize.s16),
    child: Center(
      child: Image(
        image: AssetImage(ImageAssets.mainLogo),
      ),
    ),
  );
}

Widget _registerForm() {
  return Builder(
    builder: (context) {
      print("_loginForm rebuild");
      return SizedBox(
        child: Form(
          key: context.read<RegisterViewmodelCubit>().formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppPadding.p14),
            child: Column(
              children: [
                _emailInput(context),
                _passwordInput(context),
                _confirmPasswordInput(context),
              ],
            ),
          ),
        ),
      );
    },
  );
}

Widget _emailInput(BuildContext context) {
  return SizedBox(
    height: AppSize.s75,
    child: TextFormField(
      onChanged: (value) =>
          context.read<RegisterViewmodelCubit>().setUserEmail(value),
      validator: (value) => Appvalidator.isEmpty(value, AppStrings.email),
      controller: context.read<RegisterViewmodelCubit>().emailController,
      style: const TextStyle(fontSize: AppSize.s20),
      decoration: const InputDecoration(
        hintText: AppStrings.email,
        labelText: AppStrings.email,
      ),
    ),
  );
}

Widget _passwordInput(BuildContext context) {
  print("_passwordInput rebuiled");
  return SizedBox(
    height: AppSize.s75,
    child: TextFormField(
      onChanged: (value) =>
          context.read<RegisterViewmodelCubit>().setPassword(value),
      validator: (value) => Appvalidator.isEmpty(value, AppStrings.password),
      controller: context.read<RegisterViewmodelCubit>().passwordController,
      obscureText: true,
      style: const TextStyle(fontSize: AppSize.s20),
      decoration: const InputDecoration(
        hintText: AppStrings.password,
        labelText: AppStrings.password,
      ),
    ),
  );
}

Widget _confirmPasswordInput(BuildContext context) {
  return SizedBox(
    height: AppSize.s75,
    child: TextFormField(
      // onChanged: (value) =>
      //     context.read<ForgotPasswordViewmodelCubit>().setPassword(value),
      validator: (value) => Appvalidator.isEmpty(value, AppStrings.password),
      controller:
          context.read<RegisterViewmodelCubit>().confirmPasswordController,
      obscureText: true,
      style: const TextStyle(fontSize: AppSize.s20),
      decoration: const InputDecoration(
        hintText: AppStrings.confirmPassword,
        labelText: AppStrings.confirmPassword,
      ),
    ),
  );
}

Widget _registerButton() {
  return BlocBuilder<RegisterViewmodelCubit, RegisterViewmodelState>(
    builder: (context, state) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppPadding.p14),
        child: SizedBox(
          height: AppSize.s54,
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              if (state is! RegisterLoading) {
                context.read<RegisterViewmodelCubit>().register();
              }
            },
            child: (state is RegisterLoading)
                ? const SizedBox(
                    height: AppSize.s24,
                    width: AppSize.s24,
                    child: CircularProgressIndicator())
                : const Text(AppStrings.register),
          ),
        ),
      );
    },
  );
}
