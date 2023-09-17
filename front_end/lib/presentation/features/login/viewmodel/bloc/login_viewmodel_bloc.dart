import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'login_viewmodel_event.dart';
part 'login_viewmodel_state.dart';

class LoginViewmodelBloc extends Bloc<LoginViewmodelEvent, LoginViewmodelState> {
  LoginViewmodelBloc() : super(LoginViewmodelInitial()) {
    on<LoginViewmodelEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
