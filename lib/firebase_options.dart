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
    apiKey: 'AIzaSyDvkFM-zVO8LZaqzX0Ca86OG-M8mSePaZI',
    appId: '1:868519210205:web:6ccf6d23b874734e9bff34',
    messagingSenderId: '868519210205',
    projectId: 'freya-final',
    authDomain: 'freya-final.firebaseapp.com',
    databaseURL: 'https://freya-final-default-rtdb.firebaseio.com',
    storageBucket: 'freya-final.appspot.com',
    measurementId: 'G-CW8K3X5FCP',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAxux3Z6sjA-d5KNxRCLETuD3Nga-ckRRo',
    appId: '1:868519210205:android:dfdb967640a1f7ff9bff34',
    messagingSenderId: '868519210205',
    projectId: 'freya-final',
    databaseURL: 'https://freya-final-default-rtdb.firebaseio.com',
    storageBucket: 'freya-final.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBSgP4QY4UzYoAhE7KqZ-JgrRiK-JQ_Ufk',
    appId: '1:868519210205:ios:f88cfea67573c6849bff34',
    messagingSenderId: '868519210205',
    projectId: 'freya-final',
    databaseURL: 'https://freya-final-default-rtdb.firebaseio.com',
    storageBucket: 'freya-final.appspot.com',
    iosClientId: '868519210205-u0emt1e90odf476ksm5tgg38d1qtbckl.apps.googleusercontent.com',
    iosBundleId: 'com.example.healthApp',
  );
}