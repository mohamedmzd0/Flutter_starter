
abstract class SharedPref {
  Future<void> saveToken(String token);
  // Future<String?> getToken();
  Future<void> removeToken();


  String? getToken();

}