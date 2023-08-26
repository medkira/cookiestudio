import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'login_viewmodel_state.dart';

class LoginViewmodelCubit extends Cubit<LoginViewmodelState> {
  LoginViewmodelCubit() : super(LoginViewmodelInitial());
  // LoginViewmodelCounterState(count: 0);

  void increment() {
    if (state is LoginViewmodelCounterState) {
      final count = (state as LoginViewmodelCounterState).count + 1;
      final updatedState = LoginViewmodelCounterState(count: count);
      emit(updatedState);
    } else {
      emit(LoginViewmodelCounterState(count: 1));
      // emit(Test(count: 1));
    }
  }

  void decrement() {
    final count = (state as LoginViewmodelCounterState).count - 1;
    final updatedState = LoginViewmodelCounterState(count: count);
    emit(updatedState);
  }
}



    // final count = (state as LoginViewmodelCounterState).count + 1;
    // final updatedState = LoginViewmodelCounterState(count: count);
    // emit(updatedState);

    // final count = state.count + 1;
    // final updatedState = LoginViewmodelCounterState(count: count);
    // emit(updatedState);