abstract class DataRepository {
  Future getData();
  Future login(String user, String password);
  Future<dynamic> getLookup(int id);
  Future<dynamic> postLookup(dynamic body);
}
