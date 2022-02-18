// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../data/repository/product_local_repository_impl.dart' as _i4;
import '../data/repository/product_remote_repository_impl.dart' as _i6;
import '../data/repository/product_repository_impl.dart' as _i8;
import '../domain/product_local_repository.dart' as _i3;
import '../domain/product_remote_repository.dart' as _i5;
import '../domain/product_repository.dart' as _i7;
import '../presentation/bloc/products_cubit.dart'
    as _i9; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.lazySingleton<_i3.ProductLocalRepository>(
      () => _i4.ProductLocalRepositoryImpl());
  gh.lazySingleton<_i5.ProductRemoteRepository>(
      () => _i6.ProductRemoteRepositoryImpl());
  gh.lazySingleton<_i7.ProductRepository>(() => _i8.ProductRepositoryImpl());
  gh.factory<_i9.ProductsCubit>(
      () => _i9.ProductsCubit(get<_i7.ProductRepository>()));
  return get;
}
