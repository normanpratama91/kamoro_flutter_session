import 'package:kamoro_flutter_session/models/api_data.dart';
import 'package:kamoro_flutter_session/models/list_api_data.dart';
import 'package:kamoro_flutter_session/repositories/interfaces/data_repository.dart';
import 'package:kamoro_flutter_session/helpers/rest_api.dart';

class DataRepositoryImpl implements DataRepository {
  @override
  Future getData() async {
    final restApi = RestApi();
    const url = "https://api.publicapis.org/entries";

    final json = await restApi.get(url);

    final mappedFromJson = ListApiData.fromJson(json);

    return mappedFromJson;
  }

  @override
  Future login(String user, String password) async {
    final restApi = RestApi();
    const url = "https://localhost:7230/api/v1/Authentication/login";

    try {
      final token =
          await restApi.post(url, {"email": user, "password": password});

      return token;
    } on Exception catch (e) {
      print(e);
    }
  }

  @override
  Future getLookup(int id) async {
    final restApi = RestApi();
    final url = "https://localhost:7230/api/v1/Lookup/${id.toString()}";

    try {
      final token = await restApi.get(url);

      return token;
    } on Exception catch (e) {
      print(e);
    }
  }

  @override
  Future postLookup(body) async {
    final restApi = RestApi();
    const url = "https://localhost:7230/api/v1/Lookup";

    print(body);

    try {
      final token = await restApi.post(url, body);

      return token;
    } on Exception catch (e) {
      print(e);
    }
  }
}
