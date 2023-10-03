import 'package:cookiestudio/app/app_prefs.dart';
import 'package:cookiestudio/app/constants.dart';
import 'package:cookiestudio/app/di.dart';
import 'package:cookiestudio/presentation/common/show_dialog_widget/show_dialog.dart';
import 'package:cookiestudio/presentation/features/register/viewmodel/cubit/register_viewmodel_cubit.dart';
import 'package:cookiestudio/presentation/resources/assets_manager.dart';
import 'package:cookiestudio/presentation/resources/color_manager.dart';
import 'package:cookiestudio/presentation/resources/form_validator_manager.dart';
import 'package:cookiestudio/presentation/resources/routes_manager.dart';
import 'package:cookiestudio/presentation/resources/strings_manager.dart';
import 'package:cookiestudio/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:country_code_picker/country_code_picker.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final RegisterViewmodelCubit registerViewmodel =
      instance<RegisterViewmodelCubit>();
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
      child: BlocListener<RegisterViewmodelCubit, RegisterViewmodelState>(
        listener: (context, state) {
          if (state is RegisterFailure) {
            _showRegisterFailureDialogJsonAnimation(context, state.apiMessage);
          }
          if (state is RegisterSuccess) {
            _appPreferences.setUserLoggedIn();
            _showRegisterSuccesseDialogJsonAnimation(context).then((_) {
              Navigator.pushNamed(context, Routes.mainRoute);
            });
          }
        },
        child: _getContentWidget(),
      ),
    );
  }
}

Future<void> _showRegisterFailureDialogJsonAnimation(
    BuildContext context, String apiMessage) {
  return ShowDialogResponse.showFailureDialogJsonAnimation(context, apiMessage);
}

Future<void> _showRegisterSuccesseDialogJsonAnimation(BuildContext context) {
  return ShowDialogResponse.showSuccessDialogJsonAnimation(context,
      apiMessage: AppStrings.registered, repeatAnimation: false);
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
      return SizedBox(
        child: Form(
          key: context.read<RegisterViewmodelCubit>().formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppPadding.p14),
            child: Column(
              children: [
                _usernameInput(context),
                _emailInput(context),
                _passwordInput(context),
                _confirmPasswordInput(context),
                _phoneNumberInput(context),
              ],
            ),
          ),
        ),
      );
    },
  );
}

Widget _usernameInput(BuildContext context) {
  return SizedBox(
    height: AppSize.s75,
    child: TextFormField(
      onChanged: (value) =>
          context.read<RegisterViewmodelCubit>().setUserName(value),
      validator: (value) =>
          Appvalidator.isEmpty(value, AppStrings.enterUserName),
      controller: context.read<RegisterViewmodelCubit>().userNameController,
      style: const TextStyle(fontSize: AppSize.s20),
      decoration: const InputDecoration(
        hintText: AppStrings.enterUserName,
        labelText: AppStrings.enterUserName,
      ),
    ),
  );
}

Widget _emailInput(BuildContext context) {
  return SizedBox(
    height: AppSize.s75,
    child: TextFormField(
      onChanged: (value) =>
          context.read<RegisterViewmodelCubit>().setUserEmail(value),
      validator: (value) => Appvalidator.isEmpty(value, AppStrings.enterEmail),
      controller: context.read<RegisterViewmodelCubit>().emailController,
      style: const TextStyle(fontSize: AppSize.s20),
      decoration: const InputDecoration(
        hintText: AppStrings.email,
        labelText: AppStrings.enterEmail,
      ),
    ),
  );
}

Widget _passwordInput(BuildContext context) {
  return SizedBox(
    height: AppSize.s75,
    child: TextFormField(
      onChanged: (value) =>
          context.read<RegisterViewmodelCubit>().setPassword(value),
      validator: (value) =>
          Appvalidator.isEmpty(value, AppStrings.enterPassword),
      controller: context.read<RegisterViewmodelCubit>().passwordController,
      obscureText: true,
      style: const TextStyle(fontSize: AppSize.s20),
      decoration: const InputDecoration(
        hintText: AppStrings.enterPassword,
        labelText: AppStrings.enterPassword,
      ),
    ),
  );
}

Widget _confirmPasswordInput(BuildContext context) {
  return SizedBox(
    height: AppSize.s75,
    child: TextFormField(
      onChanged: (value) =>
          context.read<RegisterViewmodelCubit>().setPassword(value),
      validator: (value) =>
          Appvalidator.isEmpty(value, AppStrings.confirmPassword),
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

Widget _phoneNumberInput(BuildContext context) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(
        flex: 1,
        child: CountryCodePicker(
          onChanged: (country) => context
              .read<RegisterViewmodelCubit>()
              .setCountryMobileCode(country.dialCode ?? Constants.empty),
          initialSelection: "+216",
          hideMainText: true,
          showCountryOnly: true,
          showOnlyCountryWhenClosed: true,
        ),
      ),
      Expanded(
        flex: 3,
        child: SizedBox(
          height: AppSize.s75,
          child: TextFormField(
            onChanged: (value) =>
                context.read<RegisterViewmodelCubit>().setMobileNumber(value),
            validator: (value) =>
                Appvalidator.isEmpty(value, AppStrings.enterPhoneNumber),
            controller:
                context.read<RegisterViewmodelCubit>().phoneNumberController,
            style: const TextStyle(fontSize: AppSize.s20),
            decoration: const InputDecoration(
              hintText: AppStrings.enterPhoneNumber,
              labelText: AppStrings.enterPhoneNumber,
            ),
          ),
        ),
      ),
    ],
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
