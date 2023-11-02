import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'cookies_categories_state.dart';

class CookiesCategoriesCubit extends Cubit<CookiesCategoriesState> {
  CookiesCategoriesCubit() : super(CookiesCategoriesInitial());
}
