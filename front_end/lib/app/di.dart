import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:cookiestudio/app/app_prefs.dart';
import 'package:cookiestudio/data/data_source/remote_data_source.dart';
import 'package:cookiestudio/data/network/app_api.dart';
import 'package:cookiestudio/data/network/dio_factory.dart';
import 'package:cookiestudio/data/network/network_info.dart';
import 'package:cookiestudio/data/repository/repository_impl.dart';
import 'package:cookiestudio/domain/repository/repository.dart';
import 'package:cookiestudio/domain/usecase/login_usecase.dart';
import 'package:cookiestudio/presentation/features/login/viewmodel/cubit/login_viewmodel_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final instance = GetIt.instance;

Future<void> initAppModule() async {
  // # app module, its a module where we put all generic dependencies

  // # shared prefs instance
  final sharedPrefs = await SharedPreferences.getInstance();
  instance.registerLazySingleton<SharedPreferences>(() => sharedPrefs);

  // # app prefs instance
  instance
      .registerLazySingleton<AppPreferences>(() => AppPreferences(sharedPrefs));

  // # network info
  instance
      .registerLazySingleton<NetworkInfo>(() => NetworkInfoImp(Connectivity()));

  // # dio factory
  instance.registerLazySingleton<DioFactory>(
      () => DioFactory(instance<AppPreferences>()));

  Dio dio = await instance<DioFactory>().getDio();

  // # app service client
  instance.registerLazySingleton<AppServiceClient>(() => AppServiceClient(dio));

  // # remote data source
  instance.registerLazySingleton<RemoteDataSource>(
      () => RemoteDataSourceImpl(instance<AppServiceClient>()));

  // # repository
  instance.registerLazySingleton<Repository>(() =>
      RepositoryImpl(instance<RemoteDataSource>(), instance<NetworkInfo>()));
}

initLoginModule() {
  if (!GetIt.I.isRegistered<LoginUseCase>()) {
    instance.registerFactory<LoginUseCase>(
        () => LoginUseCase(instance<Repository>()));

    instance.registerFactory<LoginViewmodelCubit>(
        () => LoginViewmodelCubit(instance<LoginUseCase>()));
  }
}
