import 'package:get_it/get_it.dart';
import 'package:kamoro_flutter_session/repositories/interfaces/data_repository.dart';
import 'package:kamoro_flutter_session/services/interfaces/data_service.dart';

class DataServiceImpl implements DataService {
  final _dataRepository = GetIt.instance.get<DataRepository>();
  @override
  Future getData() async {
    return await _dataRepository.getData();
  }

  @override
  Future login(String user, String password) {
    return _dataRepository.login(user, password);
  }

  @override
  Future getLookup(int id) {
    return _dataRepository.getLookup(id);
  }

  @override
  Future postLookup(body) {
    return _dataRepository.postLookup(body);
  }
}
