
import 'package:starter/feature/auth/data/UpdateResponse.dart';
import 'package:starter/feature/auth/data/data/CheckMailResponse.dart';

abstract class AuthRepo {
  Future<UpdateResponse> getAppVersion();
  Future<CheckMailResponse> login(String email, String password);
}