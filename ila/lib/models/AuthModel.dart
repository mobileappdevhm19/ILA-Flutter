import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:ila_swagger/api.dart';
import 'package:scoped_model/scoped_model.dart';

class AuthModel extends Model {
  FlutterSecureStorage storage = FlutterSecureStorage();

  AuthStatus getStatus() => defaultApiClient.getStatus();

  Future init() async {
   try {
      defaultApiClient.username = await storage.read(key: 'username');
      defaultApiClient.password = await storage.read(key: 'password');
    } catch (error) {
      // TODO error handling
    }
    if (defaultApiClient.username != null &&
        defaultApiClient.password != null) {
      await defaultApiClient.login(
          defaultApiClient.username, defaultApiClient.password);
    }
  }

  Future login(String username, String password) async {
    try {
      await defaultApiClient.login(username, password);
      await storage.write(key: 'username', value: defaultApiClient.username);
      await storage.write(key: 'password', value: defaultApiClient.password);
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
      defaultApiClient.logout();
    } catch (e) {
      // TODO error handling
    }
  }

  getAccountInfo() {
    return {
      'username': defaultApiClient.username,
    };
  }
}
