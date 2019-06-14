import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ila/models/AuthModel.dart';
import 'package:ila/swagger/ilaApiClient.dart';
import 'package:meta/meta.dart';

main() {
  group('AuthModel', () {
    group('init', () {
      test('success', () async {
        IlaApiClient client = _IlaApiClientMock(true);

        AuthModel model =
            AuthModel(client, storage: _FlutterSecureStorageMock(true));

        await model.init();

        expect(client.username, 'username');
        expect(client.password, 'password');
      });

      test('storage error', () async {
        IlaApiClient client = _IlaApiClientMock(true);

        AuthModel model =
            AuthModel(client, storage: _FlutterSecureStorageMock(false));

        await model.init();

        expect(client.username, null);
        expect(client.password, null);
      });

      test('login error', () async {
        AuthModel model = AuthModel(_IlaApiClientMock(false,error: 'error'),
            storage: _FlutterSecureStorageMock(true));

        model.init().catchError((error) => expect(error, 'error'));
      });
    });

    test('getStatus', () {
      _IlaApiClientMock client =
          _IlaApiClientMock(true, status: AuthStatus.None);
      AuthModel model =
          AuthModel(client, storage: _FlutterSecureStorageMock(true));

      expect(model.getStatus(), AuthStatus.None);
    });

    group('login', () {
      test('successful', () async {
        _IlaApiClientMock client = _IlaApiClientMock(true);
        AuthModel model =
            AuthModel(client, storage: _FlutterSecureStorageMock(true));

        await model.login('username', 'password');
      });

      test('failed storage', () async {
        _IlaApiClientMock client = _IlaApiClientMock(true);
        AuthModel model = AuthModel(client,
            storage: _FlutterSecureStorageMock(false, error: 'error'));

        try {
          await model.login('username', 'password');
          fail('should throw an error');
        } catch (error) {}
      });
    });
    group('logout', () {
      test('successful', () async {
        _IlaApiClientMock client = _IlaApiClientMock(true);
        AuthModel model =
            AuthModel(client, storage: _FlutterSecureStorageMock(true));

        await model.logout();
      });
    });
  });
}

class _IlaApiClientMock extends IlaApiClient {
  final bool success;
  final AuthStatus status;
  final Object error;

  _IlaApiClientMock(this.success, {this.error, this.status}) {}

  Future login(String username, String password) async {
    if (!success) return Future.error(error);
    this.username = username;
    this.password = password;
    return Future.value(null);
  }

  AuthStatus getStatus() => status;

  Future logout() {
    if (!success) return Future.error(error);
    return Future.value(null);
  }
}

class _FlutterSecureStorageMock extends FlutterSecureStorage {
  final bool success;
  final Object error;

  _FlutterSecureStorageMock(this.success, {this.error}) {}

  Future<String> read({@required String key}) async {
    if (!success) throw error;

    String value = '';
    switch (key) {
      case 'username':
        value = 'username';
        break;
      case 'password':
        value = 'password';
        break;
      default:
        return Future.error(error);
    }

    return Future.value(value);
  }

  Future<void> write({@required String key, @required String value}) {
    if (!success) throw error;
    return Future.value(null);
  }

  Future<void> delete({@required String key}) {
    if (!success) throw error;
    return Future.value(null);
  }
}
