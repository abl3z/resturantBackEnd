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
    apiKey: 'AIzaSyAgAcBJio6fK6eNba2luKM23-9cUbKA13s',
    appId: '1:334023134559:web:4de8eaf003c9d7b0eb3aea',
    messagingSenderId: '334023134559',
    projectId: 'abll3z',
    authDomain: 'abll3z.firebaseapp.com',
    storageBucket: 'abll3z.appspot.com',
    measurementId: 'G-Z9MBWNMLPS',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCJyz1TVe3cOVQXLB5evlKAgqVuD9aWzKQ',
    appId: '1:334023134559:android:04be1b37c2f68beeeb3aea',
    messagingSenderId: '334023134559',
    projectId: 'abll3z',
    storageBucket: 'abll3z.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCReR8PQrA3poqkmPaL7_ZqpQrBVaDyf18',
    appId: '1:334023134559:ios:3cb3b71d723e6af5eb3aea',
    messagingSenderId: '334023134559',
    projectId: 'abll3z',
    storageBucket: 'abll3z.appspot.com',
    iosBundleId: 'com.example.resturantapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCReR8PQrA3poqkmPaL7_ZqpQrBVaDyf18',
    appId: '1:334023134559:ios:151b602894646c30eb3aea',
    messagingSenderId: '334023134559',
    projectId: 'abll3z',
    storageBucket: 'abll3z.appspot.com',
    iosBundleId: 'com.example.resturantapp.RunnerTests',
  );
}
