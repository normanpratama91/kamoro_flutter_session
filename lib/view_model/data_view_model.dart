import 'package:get_it/get_it.dart';
import 'package:kamoro_flutter_session/models/list_api_data.dart';
import 'package:kamoro_flutter_session/services/interfaces/data_service.dart';
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
}
