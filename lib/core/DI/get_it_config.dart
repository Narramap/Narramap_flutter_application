import "package:get_it/get_it.dart";
import "package:injectable/injectable.dart";
import 'get_it_config.config.dart';

final GetIt getIt = GetIt.instance;

@InjectableInit()
void configureDependencies() => getIt.init();

