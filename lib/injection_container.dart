//step-9
import 'package:flutter_web/core/network.dart';
import 'package:flutter_web/domain/usecases/signIn_usecase.dart';
import 'package:flutter_web/presentation/cubit/signIn_cubit.dart';
import 'package:get_it/get_it.dart';
import 'data/datasources/auth_remote_data_source.dart';
import 'data/datasources/auth_remote_data_source_impl.dart';
import 'data/repositories_impl/auth_repo_impl.dart';
import 'domain/repositories/auth_repo.dart';

final sl = GetIt.instance;

Future<void>setupGetIt()async{
  sl.registerLazySingleton(() => DioFactory.createDio());

  sl.registerFactory(()=>SignInCubit(sl()));
  sl.registerLazySingleton(()=>SignInUseCase(sl()));
  sl.registerLazySingleton<AuthRepo>(
        () => AuthRepositoryImpl(sl()),
  );

  sl.registerLazySingleton<AuthRemoteDataSource>(
        () => AuthRemoteDataSourceImpl(dio: sl()),
  );
}
