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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBx9qhtL4Y6yXHmJ_-sa5SyQXTVsfk-2hU',
    appId: '1:834758508964:android:e8aa1447d8cb20deb98131',
    messagingSenderId: '834758508964',
    projectId: 'fic22-tiketing',
    storageBucket: 'fic22-tiketing.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBLjhoar3SefW-dvWjwQUMQTU2ePcGaC1I',
    appId: '1:834758508964:ios:c2d57b15cffac8b5b98131',
    messagingSenderId: '834758508964',
    projectId: 'fic22-tiketing',
    storageBucket: 'fic22-tiketing.firebasestorage.app',
    androidClientId: '834758508964-4idrq77jm11toln33l3apaep00qsno35.apps.googleusercontent.com',
    iosClientId: '834758508964-rguq690c463i5l8gqkvnrq32mnagqp6v.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterAyoPiknik',
  );

}