// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyAGtUHAdl-87CRdQMyqyvPI5FOreQ3rloM',
    appId: '1:96339855689:web:a139383d18dc26079b7298',
    messagingSenderId: '96339855689',
    projectId: 'semeador-live',
    authDomain: 'semeador-live.firebaseapp.com',
    storageBucket: 'semeador-live.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCtFzrogKrUeSiNHoApPuDczKSHciiAR4I',
    appId: '1:96339855689:android:ff6a1710f303183f9b7298',
    messagingSenderId: '96339855689',
    projectId: 'semeador-live',
    storageBucket: 'semeador-live.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBD1w5YaPV9gSQm_nsxX9bnC86_ELpk_wA',
    appId: '1:96339855689:ios:aa50357000733ce09b7298',
    messagingSenderId: '96339855689',
    projectId: 'semeador-live',
    storageBucket: 'semeador-live.firebasestorage.app',
    iosBundleId: 'com.example.code',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBD1w5YaPV9gSQm_nsxX9bnC86_ELpk_wA',
    appId: '1:96339855689:ios:aa50357000733ce09b7298',
    messagingSenderId: '96339855689',
    projectId: 'semeador-live',
    storageBucket: 'semeador-live.firebasestorage.app',
    iosBundleId: 'com.example.code',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAGtUHAdl-87CRdQMyqyvPI5FOreQ3rloM',
    appId: '1:96339855689:web:f9015c12efe974709b7298',
    messagingSenderId: '96339855689',
    projectId: 'semeador-live',
    authDomain: 'semeador-live.firebaseapp.com',
    storageBucket: 'semeador-live.firebasestorage.app',
  );

}