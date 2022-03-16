import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:travel/providers/login_provider.dart';

import 'injection.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: r'$initGetIt', // default
  preferRelativeImports: true, // default
  asExtension: false, // default
)
void configureDependencies() => {
      $initGetIt(getIt),
      getIt.registerSingleton<LoginInfo>(LoginInfo()),
    };

T inject<T extends Object>(
        {String? instanceName, dynamic param1, dynamic param2}) =>
    getIt.get<T>(instanceName: instanceName, param1: param1, param2: param2);
