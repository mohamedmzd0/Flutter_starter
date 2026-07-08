import 'package:starter/core/network/api_client.dart';
import 'package:starter/core/network/api_constants.dart';
import 'package:starter/feature/auth/data/UpdateResponse.dart';
import 'package:starter/feature/auth/data/data/CheckMailResponse.dart';
import 'package:starter/feature/auth/domain/AuthRepo.dart';

class AuthRepoImpl implements AuthRepo {
  AuthRepoImpl(this._apiClient);

  final ApiClient _apiClient;

  @override
  Future<UpdateResponse> getAppVersion() {
    return _apiClient.get(
      path: ApiConstants.getAppVersion,
      queryParameters: {
        'platform': 'android',
      },
      fromJson: UpdateResponse.fromJson,
    );
  }

  @override
  Future<CheckMailResponse> login(String email, String password) async {
  return _apiClient.post(path: ApiConstants.login, fromJson: CheckMailResponse.fromJson,
      body: {"emailOrMobile": email});
  }
}
