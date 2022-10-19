import 'package:get_it/get_it.dart';
import 'package:kamoro_flutter_session/repositories/interfaces/data_repository.dart';
import 'package:kamoro_flutter_session/services/interfaces/data_service.dart';

class DataServiceImpl implements DataService {
  final _dataRepository = GetIt.instance.get<DataRepository>();
  @override
  Future getData() async {
    return await _dataRepository.getData();
  }
}
