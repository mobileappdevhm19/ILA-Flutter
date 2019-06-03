import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:ila/helpers/userException.dart';
import 'package:ila/swagger/ilaApiClient.dart';
import 'package:ila_swagger/api.dart';
import 'package:scoped_model/scoped_model.dart';

class AuthModel extends Model {
  FlutterSecureStorage storage = FlutterSecureStorage();

  AuthStatus getStatus() => getApiClient().getStatus();

  IlaApiClient getApiClient() => (defaultApiClient as IlaApiClient);

  AuthModel(IlaApiClient apiClient) {
    defaultApiClient = apiClient;
  }

  Future init() async {
    try {
      getApiClient().username =
          await storage.read(key: 'username');
      getApiClient().password =
          await storage.read(key: 'password');
    } catch (error) {
      // TODO error handling
    }
    if (getApiClient().username != null &&
        getApiClient().password != null) {
      await getApiClient().login(
          getApiClient().username,
          getApiClient().password);
    }
  }

  Future login(String username, String password) async {
    try {
      await (defaultApiClient as IlaApiClient).login(username, password);
      await storage.write(
          key: 'username', value: (defaultApiClient as IlaApiClient).username);
      await storage.write(
          key: 'password', value: (defaultApiClient as IlaApiClient).password);
    } catch (error) {
      try {
        storage.delete(key: 'username');
        storage.delete(key: 'password');
      } catch (e) {}
      if (error is UserException)
        throw error;
      else {
        throw error;
        // TODO error handling
      }
    }
  }

  Future logout() async {
    try {
      await storage.delete(key: 'username');
      await storage.delete(key: 'password');
      getApiClient().logout();
    } catch (e) {
      // TODO error handling
    }
  }

  getAccountInfo() {
    return {
      'username': getApiClient().username,
    };
  }
}
