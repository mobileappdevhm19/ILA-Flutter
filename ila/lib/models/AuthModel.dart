import 'dart:io';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:ila/helpers/userException.dart';
import 'package:ila/swagger/ilaApiClient.dart';
import 'package:ila_swagger/api.dart';
import 'package:scoped_model/scoped_model.dart';
//import 'package:firebase_messaging/firebase_messaging.dart';
//import 'package:device_info/device_info.dart';

class AuthModel extends Model {
  FlutterSecureStorage storage;
  //FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  //final DeviceInfoPlugin deviceInfoPlugin = new DeviceInfoPlugin();

  String _fcmToken;

  AuthStatus getStatus() => getApiClient().getStatus();

  IlaApiClient getApiClient() => (defaultApiClient as IlaApiClient);

  AuthModel(IlaApiClient apiClient, {this.storage}) {
    defaultApiClient = apiClient;
    if(storage == null)
      storage = FlutterSecureStorage();
  }

  Future init() async {

    // initialize firebase cloud messaging
    /*if (Platform.isIOS) _iOS_Permission();

    await _firebaseMessaging
        .getToken()
        .then((token) => _fcmToken = token)
        .then((_) {
      if (getStatus() == AuthStatus.LoggedIn) _uploadFcmToken();
    });

    print(_fcmToken);
    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        print('on message $message');
        // TODO: handle new pushnotifications
      },
      onResume: (Map<String, dynamic> message) async {
        print('on resume $message');
        // TODO: navigate correct view
      },
      onLaunch: (Map<String, dynamic> message) async {
        print('on launch $message');
        // TODO: same like onResume
      },
    );*/

    // load user credentials and login
    try {
      getApiClient().username = await storage.read(key: 'username');
      getApiClient().password = await storage.read(key: 'password');
    } catch (error) {
      // TODO error handling
    }
    if (getApiClient().username != null && getApiClient().password != null) {
      await getApiClient()
          .login(getApiClient().username, getApiClient().password);
      if (getStatus() == AuthStatus.LoggedIn) {
        //await _uploadFcmToken();
      }
    }
  }

  Future login(String username, String password) async {
    try {
      await (defaultApiClient as IlaApiClient).login(username, password);
      await storage.write(
          key: 'username', value: (defaultApiClient as IlaApiClient).username);
      await storage.write(
          key: 'password', value: (defaultApiClient as IlaApiClient).password);
      //await _uploadFcmToken();
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
      await getApiClient().logout();
    } catch (e) {
      // TODO error handling
    }
  }

  getAccountInfo() {
    return {
      'username': getApiClient().username,
    };
  }

  /*void _iOS_Permission() {
    _firebaseMessaging.requestNotificationPermissions(
        IosNotificationSettings(sound: true, badge: true, alert: true));
    _firebaseMessaging.onIosSettingsRegistered
        .listen((IosNotificationSettings settings) {
      //TODO: anything to do?
    });
  }*/

  /*Future _uploadFcmToken() async {
    print('try to update');
    if (_fcmToken == null || _fcmToken == '') return;

    var deviceName;
    if (Platform.isAndroid) {
      deviceName = (await deviceInfoPlugin.androidInfo).model;
    } else if (Platform.isIOS) {
      deviceName = (await deviceInfoPlugin.iosInfo).name;
    }
    await UserApi().userPostToken(SavePushToken.fromJson({
      'token': _fcmToken,
      'deviceId': deviceName,
    }));
    print('uupdated');
  }*/
}
