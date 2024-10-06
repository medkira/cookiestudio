import 'package:bloc/bloc.dart';
import 'package:cookiestudio/presentation/base/baseviewmodel.dart';
import 'package:equatable/equatable.dart';

part 'profile_viewmodel_state.dart';

class ProfileViewmodelCubit extends Cubit<ProfileViewmodelState>
    implements ProfileViewModelInputs, BaseViewModel {
  ProfileViewmodelCubit() : super(ProfileViewmodelInitial());

  @override
  void dispose() {
    // TODO: implement dispose
  }

  @override
  void start() {
    // TODO: implement start
  }

  @override
  lougout() {
    // TODO : need to change things here like removing the token if i a dd an server!!

    emit(LougoutLoading());
    // Todo : i add this just to present the project all of this need to be changed/maybe?
    Future.delayed(Duration(seconds: 1), () {
      emit(LougoutSuccess());
    });
  }
}

abstract class ProfileViewModelInputs {
  lougout();
}
