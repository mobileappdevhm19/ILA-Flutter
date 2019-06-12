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
        AuthModel model = AuthModel(_IlaApiClientMock(false),
            storage: _FlutterSecureStorageMock(true));

        model.init().catchError((error) => expect(error, 'error'));
      });
    });

    group('login', (){});
    group('logout', (){});
    group('getAccountInfo', (){});
  });
}

class _IlaApiClientMock extends IlaApiClient {
  final bool success;

  _IlaApiClientMock(this.success) {}

  Future login(String username, String password) async {
    if (!success) return Future.error('error');
    this.username = username;
    this.password = password;
    return Future.value(null);
  }
}

class _FlutterSecureStorageMock extends FlutterSecureStorage {
  final bool success;

  _FlutterSecureStorageMock(this.success) {}

  Future<String> read({@required String key}) async {
    if (!success) return Future.error(null);

    String value = '';
    switch (key) {
      case 'username':
        value = 'username';
        break;
      case 'password':
        value = 'password';
        break;
      default:
        return Future.error(null);
    }

    return Future.value(value);
  }
}
