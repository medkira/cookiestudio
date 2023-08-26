import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../viewmodel/cubit/login_viewmodel_cubit.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginViewmodelCubit(),
      child: const CounterPage(),
    );
  }
}

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Counter')),
      body: BlocBuilder<LoginViewmodelCubit, LoginViewmodelState>(
        builder: (context, state) {
          if (state is LoginViewmodelInitial) {
            return const Center(child: Text('state from init is initial '));
          } else if (state is LoginViewmodelCounterState) {
            return Center(child: Text('${(state).count}'));
          } else {
            return const Center(child: Text('empty'));
          }
        },
      ),
      floatingActionButton: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          ElevatedButton(
            child: const Icon(Icons.add),
            onPressed: () => context.read<LoginViewmodelCubit>().increment(),
          ),
          const SizedBox(height: 4),
          ElevatedButton(
            child: const Icon(Icons.remove),
            onPressed: () => context.read<LoginViewmodelCubit>().decrement(),
          ),
        ],
      ),
    );
  }
}
