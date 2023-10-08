import 'package:bloc/bloc.dart';
import 'package:cookiestudio/presentation/base/baseviewmodel.dart';
import 'package:flutter/material.dart';

part 'home_viewmodel_state.dart';

class HomeViewmodelCubit extends Cubit<HomeViewmodelState>
    implements BaseViewModel, HomeViewmodelInputs {
  HomeViewmodelCubit() : super(HomeViewmodelInitial());

  final _searchBarController = TextEditingController();
  late String _search;
  TextEditingController get searchBarController => _searchBarController;

  @override
  void dispose() {
    searchBarController.dispose();
  }

  @override
  void start() {
    // TODO: implement start
  }

  @override
  setUserSearch(String search) {
    _search = search;
  }
}

abstract class HomeViewmodelInputs {
  setUserSearch(String search);
}
