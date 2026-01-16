import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'di.config.dart';

final serviceLocator = GetIt.instance;

@InjectableInit()
Future<void> configureDependencies() async {
  serviceLocator.init();
}
