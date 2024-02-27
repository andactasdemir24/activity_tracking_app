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
    apiKey: 'AIzaSyAXbzrxMS6duQw6Y1EMriVkFZHyZ-Q2Ha4',
    appId: '1:81955523162:web:c7d8ac873eea849f572663',
    messagingSenderId: '81955523162',
    projectId: 'kartek-case',
    authDomain: 'kartek-case.firebaseapp.com',
    storageBucket: 'kartek-case.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAscbb3hTlHEtQ-1ETNFCCBTMCIeTH8AT8',
    appId: '1:81955523162:android:cb645f831a0585aa572663',
    messagingSenderId: '81955523162',
    projectId: 'kartek-case',
    storageBucket: 'kartek-case.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCNMy82pWSyYDQqrGhSNEa0zjGsY4TC6Qk',
    appId: '1:81955523162:ios:74d6a8baeb8a955a572663',
    messagingSenderId: '81955523162',
    projectId: 'kartek-case',
    storageBucket: 'kartek-case.appspot.com',
    iosBundleId: 'com.example.andacCase',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCNMy82pWSyYDQqrGhSNEa0zjGsY4TC6Qk',
    appId: '1:81955523162:ios:c020cee22635c79e572663',
    messagingSenderId: '81955523162',
    projectId: 'kartek-case',
    storageBucket: 'kartek-case.appspot.com',
    iosBundleId: 'com.example.andacCase.RunnerTests',
  );
}