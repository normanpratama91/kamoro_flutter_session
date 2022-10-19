import 'package:get_it/get_it.dart';
import 'package:kamoro_flutter_session/repositories/implementations/data_repository_impl.dart';
import 'package:kamoro_flutter_session/repositories/interfaces/data_repository.dart';
import 'package:kamoro_flutter_session/services/implementations/data_service_impl.dart';
import 'package:kamoro_flutter_session/services/interfaces/data_service.dart';

final GetIt serviceLocator = GetIt.instance;

setupServiceLocator() {
  serviceLocator.registerSingleton<DataRepository>(DataRepositoryImpl());

  serviceLocator.registerSingleton<DataService>(DataServiceImpl());
}
