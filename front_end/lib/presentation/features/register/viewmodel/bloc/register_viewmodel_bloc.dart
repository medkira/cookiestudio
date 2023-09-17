import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'register_viewmodel_event.dart';
part 'register_viewmodel_state.dart';

class RegisterViewmodelBloc extends Bloc<RegisterViewmodelEvent, RegisterViewmodelState> {
  RegisterViewmodelBloc() : super(RegisterViewmodelInitial()) {
    on<RegisterViewmodelEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
