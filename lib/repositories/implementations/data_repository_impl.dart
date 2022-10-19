import 'package:kamoro_flutter_session/models/api_data.dart';
import 'package:kamoro_flutter_session/models/list_api_data.dart';
import 'package:kamoro_flutter_session/repositories/interfaces/data_repository.dart';
import 'package:kamoro_flutter_session/restApi.dart';

class DataRepositoryImpl implements DataRepository {
  @override
  Future getData() async {
    final restApi = RestApi();
    const url = "https://api.publicapis.org/entries";

    final json = await restApi.get(url);

    final mappedFromJson = ListApiData.fromJson(json);

    return mappedFromJson;
  }
}
