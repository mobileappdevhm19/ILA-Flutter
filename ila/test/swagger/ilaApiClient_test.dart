import 'package:flutter_test/flutter_test.dart';
import 'package:ila/swagger/ilaApiClient.dart';

main() {
  group('IlaApiClient', () {
    group('', () {
      // TODO ISSUE: 72
    });
    group('JWT', () {
      test('fromJsonString', () {
        var jwt = JWT.fromJsonString({
          'id': 1,
          'iat': 1555459200,
          'exp': 1555459500,
          'sub': 'subject',
          'aud': 'audience',
          'iss': 'issuer',
        });

        expect(jwt.id, 1);
        expect(jwt.iat, 1555459200);
        expect(jwt.exp, 1555459500);
        expect(jwt.sub, 'subject');
        expect(jwt.aud, 'audience');
        expect(jwt.iss, 'issuer');
        expect(jwt.expiresAt.toUtc(), DateTime.utc(2019, 4, 17, 0, 5));
      });
    });
  });
}
