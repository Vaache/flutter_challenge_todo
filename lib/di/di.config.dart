// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:todo_challange/core/services/preferences.dart' as _i838;
import 'package:todo_challange/core/services/todos_service.dart' as _i515;
import 'package:todo_challange/features/home/data/data_source/todo_data_source.dart'
    as _i247;
import 'package:todo_challange/features/home/data/data_source/todo_data_source_impl.dart'
    as _i319;
import 'package:todo_challange/features/home/data/todo_repository_impl.dart'
    as _i970;
import 'package:todo_challange/features/home/domain/todo_repository.dart'
    as _i361;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.factory<_i838.PreferencesService>(() => _i838.PreferencesService());
    gh.factory<_i515.TodosService>(
      () => _i515.TodosService(gh<_i838.PreferencesService>()),
    );
    gh.factory<_i247.TodoDataSource>(
      () => _i319.TodoDataSourceImpl(gh<_i515.TodosService>()),
    );
    gh.factory<_i361.TodoRepository>(
      () => _i970.TodoRepositoryImpl(gh<_i247.TodoDataSource>()),
    );
    return this;
  }
}
