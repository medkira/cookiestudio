import 'package:cookiestudio/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Register Page")),
    );
  }
}

// Widget _confirmPasswordInput(BuildContext context) {
//   return SizedBox(
//     height: AppSize.s75,
//     child: TextFormField(
//       // onChanged: (value) =>
//       //     context.read<ForgotPasswordViewmodelCubit>().setPassword(value),
//       validator: (value) => Appvalidator.isEmpty(value, AppStrings.password),
//       controller:
//           context.read<ForgotPasswordViewmodelCubit>().passwordController,
//       obscureText: true,
//       style: const TextStyle(fontSize: AppSize.s20),
//       decoration: const InputDecoration(
//         hintText: AppStrings.password,
//         labelText: AppStrings.password,
//       ),
//     ),
//   );
// }
