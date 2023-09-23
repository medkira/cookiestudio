import 'package:cookiestudio/app/app_prefs.dart';
import 'package:cookiestudio/app/di.dart';
import 'package:cookiestudio/presentation/common/show_dialog_widget/show_dialog.dart';
import 'package:cookiestudio/presentation/resources/assets_manager.dart';
import 'package:cookiestudio/presentation/resources/color_manager.dart';
import 'package:cookiestudio/presentation/resources/routes_manager.dart';
import 'package:cookiestudio/presentation/resources/strings_manager.dart';
import 'package:cookiestudio/presentation/resources/validator_manager.dart';
import 'package:cookiestudio/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../viewmodel/cubit/login_viewmodel_cubit.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final LoginViewmodelCubit loginViewModel = instance<LoginViewmodelCubit>();
  final AppPreferences _appPreferences = instance<AppPreferences>();

  void _bind() {
    loginViewModel.start();
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  void dispose() {
    loginViewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => loginViewModel,
      child: BlocListener<LoginViewmodelCubit, LoginViewmodelState>(
        listener: (context, state) {
          if (state is LoginFailure) {
            _showLoginFailureDialogJsonAnimation(context, state.apiMessage);
          }
          if (state is LoginSuccess) {
            // save that  user is already logged in
            _appPreferences.setUserLoggedIn();
            // naviagte to main  route
            Navigator.pushNamed(context, Routes.mainRoute);
          }
        },
        child: _getContentWidget(),
      ),
    );
  }
}

Future<void> _showLoginFailureDialogJsonAnimation(
    BuildContext context, String apiMessage) {
  return ShowDialogResponse.showFailureDialogJsonAnimation(context, apiMessage);
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
        children: [
          _loginLogo(),
          _loginForm(),
          _loginButton(),
          Padding(
            padding: const EdgeInsets.symmetric(
                vertical: AppPadding.p16, horizontal: AppPadding.p14),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _forgetPasswordButton(),
                _registerButton(),
              ],
            ),
          )
        ],
      ),
    ),
  );
}

Widget _loginLogo() {
  return const Padding(
    padding: EdgeInsets.only(top: AppSize.s60, bottom: AppSize.s16),
    child: Center(
      child: Image(
        image: AssetImage(ImageAssets.mainLogo),
      ),
    ),
  );
}

Widget _loginForm() {
  return Builder(
    builder: (context) {
      print("_loginForm rebuild");
      return SizedBox(
        child: Form(
          key: context.read<LoginViewmodelCubit>().formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppPadding.p14),
            child: Column(
              children: [
                _emailInput(context),
                _passwordInput(context),
              ],
            ),
          ),
        ),
      );
    },
  );
}

Widget _emailInput(BuildContext context) {
  print("_emailInput rebuild");
  return SizedBox(
    height: AppSize.s75,
    child: TextFormField(
      onChanged: (value) =>
          context.read<LoginViewmodelCubit>().setUserEmail(value),
      validator: (value) => Appvalidator.isEmpty(value, AppStrings.email),
      controller: context.read<LoginViewmodelCubit>().emailController,
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
          context.read<LoginViewmodelCubit>().setPassword(value),
      validator: (value) => Appvalidator.isEmpty(value, AppStrings.password),
      controller: context.read<LoginViewmodelCubit>().passwordController,
      obscureText: true,
      style: const TextStyle(fontSize: AppSize.s20),
      decoration: const InputDecoration(
        hintText: AppStrings.password,
        labelText: AppStrings.password,
      ),
    ),
  );
}

Widget _loginButton() {
  print("_loginButton rebuild");

  return BlocBuilder<LoginViewmodelCubit, LoginViewmodelState>(
    builder: (context, state) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppPadding.p14),
        child: SizedBox(
          height: AppSize.s54,
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              if (state is! LoginLoading) {
                context.read<LoginViewmodelCubit>().login();
              }
            },
            child: (state is LoginLoading)
                ? const SizedBox(
                    height: AppSize.s24,
                    width: AppSize.s24,
                    child: CircularProgressIndicator())
                : const Text(AppStrings.login),
          ),
        ),
      );
    },
  );
}

Widget _forgetPasswordButton() {
  return Builder(builder: (context) {
    return TextButton(
      onPressed: () {
        Navigator.pushNamed(context, Routes.forgotPasswordRoute);
      },
      child: const Text(
        AppStrings.forgetPassword,
      ),
    );
  });
}

Widget _registerButton() {
  return TextButton(
    onPressed: () {},
    child: const Text(AppStrings.register),
  );
}

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Counter')),
      body: Column(
        children: [
          Container(
            height: AppSize.s100,
            child: BlocBuilder<LoginViewmodelCubit, LoginViewmodelState>(
              builder: (context, state) {
                print("widget rebuild");
                if (state is LoginInfo) {
                  return Center(child: Text((state).email));
                } else {
                  return const Center(child: Text("no state "));
                }

                // if (state is LoginViewmodelInitial) {
                //   return const Center(child: Text('state from init is initial '));
                // } else if (state is LoginViewmodelCounterState) {
                //   return Center(child: Text('${(state).count}'));
                // } else {
                //   return const Center(child: Text('empty'));
                // }
              },
            ),
          ),
          BlocListener<LoginViewmodelCubit, LoginViewmodelState>(
            listener: (context, state) {
              if (state is LoginInfo) {
                print("hiiiiii");
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Welcome, ${state.email}!"),
                  ),
                );
              } else {
                // return const Center(child: Text("no state "));
              }
            },
            child: Container(),
          ),
          Padding(
            padding: const EdgeInsets.all(AppPadding.p14),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Form(
                  key: context.read<LoginViewmodelCubit>().formKey,
                  child: TextFormField(
                    onChanged: (value) =>
                        context.read<LoginViewmodelCubit>().setUserEmail(value),
                    validator: (value) {
                      if (value!.length < 2) {
                        return "value need to be more than 2  ";
                      }
                      return null;
                    },
                    controller:
                        context.read<LoginViewmodelCubit>().emailController,
                    style: const TextStyle(fontSize: AppSize.s20),
                  ),
                ),
                const SizedBox(height: AppSize.s16),
                TextFormField(
                  onChanged: (value) =>
                      context.read<LoginViewmodelCubit>().setPassword(value),
                  controller:
                      context.read<LoginViewmodelCubit>().passwordController,
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          ElevatedButton(
            child: const Icon(Icons.add),
            onPressed: () => context.read<LoginViewmodelCubit>().login(),
            // onPressed: () => (),
          ),
          const SizedBox(height: 4),
          ElevatedButton(
            child: const Icon(Icons.remove),
            // onPressed: () => context.read<LoginViewmodelCubit>().decrement(),
            onPressed: () => context.read<LoginViewmodelCubit>().login(),
          ),
        ],
      ),
    );
  }
}

// BlocBuilder<LoginViewmodelCubit, LoginViewmodelState>(
//           builder: (context, state) {
//             print("count rebuild");
//             if (state is LoginViewmodelCounterState) {
//               return Container(
//                 child: Text("${(state).count}"),
//               );
//             } else {
//               return Container(
//                 child: Text("{(countstate)."),
//               );
//             }
//           },
//         ),
//         BlocBuilder<LoginViewmodelCubit, LoginViewmodelState>(
//           builder: (context, state) {
//             print("counter button rebuild");
//             return ElevatedButton(
//               child: const Icon(Icons.remove),
//               onPressed: () =>
//                   context.read<LoginViewmodelCubit>().decrement(),
//               // onPressed: () => context.read<LoginViewmodelCubit>().login(context),
//             );
//           },
//         ),

// AppServiceClient _appServiceClient = AppServiceClient(dio);
// RemoteDataSource _remoteDataSource = RemoteDataSourceImpl(_appServiceClient);
// Repository _repository =RepositoryImpl(_remoteDataSource, _networkInfo);
// final  LoginUseCase  _loginUseCase = LoginUseCase(_repository;)

// Future<void> _showLoginFailureDialogJsonAnimation(
//     BuildContext context, String apiMessage) {
//   return showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return AlertDialog(
//         content: SizedBox(
//           height: AppSize.s350,
//           child: Column(
//             children: [
//               getAnimatedImage(JsonAssets.error),
//               const SizedBox(height: AppSize.s20),
//               Text(
//                 textAlign: TextAlign.center,
//                 apiMessage,
//                 style: Theme.of(context).textTheme.bodyLarge,
//               ),
//             ],
//           ),
//         ),
//         actions: [
//           TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//               child: const Text(AppStrings.ok))
//         ],
//       );
//     },
//   );
// }

// Future<void> _showLoginFailureDialog(BuildContext context, String apiMessage) {
//   return showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: const Text('Popup Title'),
//           content: Text(apiMessage),
//           actions: [
//             TextButton(
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                 },
//                 child: const Text(AppStrings.ok))
//           ],
//         );
//       });
// }
