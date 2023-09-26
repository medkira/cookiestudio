import 'package:cookiestudio/app/di.dart';
import 'package:cookiestudio/presentation/common/show_dialog_widget/show_dialog.dart';
import 'package:cookiestudio/presentation/features/forgot_password/viewmodel/cubit/forgot_password_viewmodel_cubit.dart';
import 'package:cookiestudio/presentation/resources/assets_manager.dart';
import 'package:cookiestudio/presentation/resources/color_manager.dart';
import 'package:cookiestudio/presentation/resources/strings_manager.dart';
import 'package:cookiestudio/presentation/resources/form_validator_manager.dart';
import 'package:cookiestudio/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({super.key});

  @override
  State<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  final ForgotPasswordViewmodelCubit forgotPasswordViewmodel =
      instance<ForgotPasswordViewmodelCubit>();

  void _bind() {
    forgotPasswordViewmodel.start();
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => forgotPasswordViewmodel,
      child: BlocListener<ForgotPasswordViewmodelCubit,
          ForgotPasswordViewmodelState>(
        listener: (context, state) {
          if (state is ForgotPasswordFailure) {
            _showLoginFailureDialogJsonAnimation(context, state.apiMessage);
          }
          if (state is ForgotPasswordSuccess) {
            _showLoginSuccessDialogJsonAnimation(context, state.apiMessage);
          }
        },
        child: _getContentWidget(),
      ),
    );
  }

  Future<void> _showLoginFailureDialogJsonAnimation(
      BuildContext context, String apiMessage) {
    return ShowDialogResponse.showFailureDialogJsonAnimation(
        context, apiMessage);
  }

  Future<void> _showLoginSuccessDialogJsonAnimation(
      BuildContext context, String apiMessage) {
    return ShowDialogResponse.showSuccessDialogJsonAnimation(
        context, apiMessage);
  }

  Widget _getContentWidget() {
    return Scaffold(
      backgroundColor: lightColorScheme.background,
      appBar: AppBar(
        scrolledUnderElevation: AppSize.s1_5,
        toolbarHeight: AppSize.s0,
        automaticallyImplyLeading: false,
        backgroundColor: lightColorScheme.background,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.dark,
          statusBarColor: lightColorScheme.background,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _logo(),
            _resetPassWordForm(),
            _resetPasswordButton(),
            const Padding(
              padding: EdgeInsets.symmetric(
                  vertical: AppPadding.p16, horizontal: AppPadding.p14),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _logo() {
    return const Padding(
      padding: EdgeInsets.only(top: AppSize.s60, bottom: AppSize.s16),
      child: Center(
        child: Image(
          image: AssetImage(ImageAssets.mainLogo),
        ),
      ),
    );
  }

  Widget _resetPassWordForm() {
    return Builder(
      builder: (context) {
        return SizedBox(
          child: Form(
            key: context.read<ForgotPasswordViewmodelCubit>().formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppPadding.p14),
              child: Column(
                children: [
                  _emailInput(context),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

Widget _emailInput(BuildContext context) {
  return SizedBox(
    height: AppSize.s80,
    child: TextFormField(
      onChanged: (value) =>
          context.read<ForgotPasswordViewmodelCubit>().setUserEmail(value),
      validator: (value) => Appvalidator.isEmpty(value, AppStrings.email),
      controller: context.read<ForgotPasswordViewmodelCubit>().emailController,
      style: const TextStyle(fontSize: AppSize.s20),
      decoration: const InputDecoration(
        hintText: AppStrings.email,
        labelText: AppStrings.email,
      ),
    ),
  );
}

Widget _resetPasswordButton() {
  return BlocBuilder<ForgotPasswordViewmodelCubit,
      ForgotPasswordViewmodelState>(
    builder: (context, state) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppPadding.p14),
        child: SizedBox(
          height: AppSize.s54,
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              if (state is! ForgotPasswordLoading) {
                context.read<ForgotPasswordViewmodelCubit>().resetPassword();
              }
            },
            child: (state is ForgotPasswordLoading)
                ? const SizedBox(
                    height: AppSize.s24,
                    width: AppSize.s24,
                    child: CircularProgressIndicator())
                : const Text(
                    AppStrings.resetPassword,
                    style: TextStyle(fontSize: AppSize.s24),
                  ),
          ),
        ),
      );
    },
  );
}
