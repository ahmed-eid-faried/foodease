// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCRvvevHeky2pGzjHZjzrG56vy4MFBrM60',
    appId: '1:704082933224:web:89b4eec9942c6a997ba05d',
    messagingSenderId: '704082933224',
    projectId: 'dishdelight-amadytech',
    authDomain: 'dishdelight-amadytech.firebaseapp.com',
    storageBucket: 'dishdelight-amadytech.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCsWybzcanSmpzPZ1SNBLUV725WWGLX5gM',
    appId: '1:704082933224:android:681db22bd3032fbc7ba05d',
    messagingSenderId: '704082933224',
    projectId: 'dishdelight-amadytech',
    storageBucket: 'dishdelight-amadytech.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAaTomPLMc7lNCODDDpgWlQL0bEHtJaPPo',
    appId: '1:704082933224:ios:43437c719dd85fd37ba05d',
    messagingSenderId: '704082933224',
    projectId: 'dishdelight-amadytech',
    storageBucket: 'dishdelight-amadytech.appspot.com',
    iosBundleId: 'com.example.foodease',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAaTomPLMc7lNCODDDpgWlQL0bEHtJaPPo',
    appId: '1:704082933224:ios:325360d242a153957ba05d',
    messagingSenderId: '704082933224',
    projectId: 'dishdelight-amadytech',
    storageBucket: 'dishdelight-amadytech.appspot.com',
    iosBundleId: 'com.example.foodease.RunnerTests',
  );
}
