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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyCA_ScD7qrVqwGhi5DteMtxU_7xpgY5rE4',
    appId: '1:138057002732:web:00b238fe14994069b3bfc9',
    messagingSenderId: '138057002732',
    projectId: 'app-mobile-final',
    authDomain: 'app-mobile-final.firebaseapp.com',
    storageBucket: 'app-mobile-final.appspot.com',
    measurementId: 'G-R5QGMD145W',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyANyoW1cM9A3Bw5FxgmgsqF1n08G7f05ZY',
    appId: '1:138057002732:android:c4ba36a28393d76db3bfc9',
    messagingSenderId: '138057002732',
    projectId: 'app-mobile-final',
    storageBucket: 'app-mobile-final.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAib6QseMwfjapiNNUvDpLHunPb1NF3-Ms',
    appId: '1:138057002732:ios:8cf53b7fff4ae334b3bfc9',
    messagingSenderId: '138057002732',
    projectId: 'app-mobile-final',
    storageBucket: 'app-mobile-final.appspot.com',
    iosClientId: '138057002732-t4umf41fot13r9umnkbmdqnf9d2u8bk7.apps.googleusercontent.com',
    iosBundleId: 'com.example.appRecipes',
  );
}
