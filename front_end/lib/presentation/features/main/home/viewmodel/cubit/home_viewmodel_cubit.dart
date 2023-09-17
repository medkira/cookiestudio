import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'home_viewmodel_state.dart';

class HomeViewmodelCubit extends Cubit<HomeViewmodelState> {
  HomeViewmodelCubit() : super(HomeViewmodelInitial());
}
