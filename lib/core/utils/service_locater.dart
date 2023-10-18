import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../Features/_2_home/data/data_sources/home_local_data_source_impl.dart';
import '../../Features/_2_home/data/data_sources/home_remote_data_source_impl.dart';
import '../../Features/_2_home/data/repos/home_repo_impl.dart';
import 'api_service.dart';

final getIt = GetIt.instance;

void setupServiceLocater() {
  getIt.registerSingleton<ApiService>(
    ApiService(
      Dio(),
    ),
  );

  getIt.registerSingleton<HomeRepoImpl>(
    HomeRepoImpl(
      homeLocalDataSource: HomeLocalDataSourceImpl(),
      homeRemoteDataSource: HomeRemoteDataSourceImpl(
        getIt.get<ApiService>(),
      ),
    ),
  );

  // getIt.registerSingleton<HomeRepoImpl>(
  //   HomeRepoImpl(
  //     getIt.get<ApiService>(),
  //   ),
  // );
}
