import 'package:get_it/get_it.dart';
import 'package:kamoro_flutter_session/models/list_api_data.dart';
import 'package:kamoro_flutter_session/services/interfaces/data_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';

// layer between UI and Service
class DataViewModel extends BaseViewModel {
  final _dataService = GetIt.instance.get<DataService>();

  ListApiData? listData;

  Future getData() async {
    listData = await runBusyFuture(_getData());
  }

  Future<ListApiData> _getData() async {
    //call service layer here
    final svc = _dataService.getData();
    var result = await runBusyFuture(svc);

    return result;
  }

  Future login(String user, String password) async {
    //call service layer here
    final svc = _dataService.login(user, password);
    var result = await runBusyFuture(svc);

    final shr = await SharedPreferences.getInstance();
    await shr.setString('token', result);

    return result;
  }

  
  // LOOKUP
  Future getLookup(int id) async {
    //call service layer here
    final svc = _dataService.getLookup(id);
    var result = await runBusyFuture(svc);

    return result;
  }
  Future postLookup(dynamic body) async {
    //call service layer here
    final svc = _dataService.postLookup(body);
    var result = await runBusyFuture(svc);

    return result;
  }
}
