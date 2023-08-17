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
    apiKey: 'AIzaSyCIO2rj9sw9kupJmfzU-P0MMeRwphRooaw',
    appId: '1:739983564830:web:1df456a4ff0e01ffb94e0f',
    messagingSenderId: '739983564830',
    projectId: 'my-flutter-mart',
    authDomain: 'my-flutter-mart.firebaseapp.com',
    storageBucket: 'my-flutter-mart.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB6wpA6RjN5yRQQVKjiSmDg1nlzkWZayxg',
    appId: '1:739983564830:android:a7259d5e776a5e76b94e0f',
    messagingSenderId: '739983564830',
    projectId: 'my-flutter-mart',
    storageBucket: 'my-flutter-mart.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCTthLexxYHIvK2Rj1YrUrZq3KETpJCCTM',
    appId: '1:739983564830:ios:d557fc619176fd6ab94e0f',
    messagingSenderId: '739983564830',
    projectId: 'my-flutter-mart',
    storageBucket: 'my-flutter-mart.appspot.com',
    iosClientId: '739983564830-75mvvbv3dq4b01tala9qe7b10e0vbfhb.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterMart',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCTthLexxYHIvK2Rj1YrUrZq3KETpJCCTM',
    appId: '1:739983564830:ios:6bedb97d9711b5a0b94e0f',
    messagingSenderId: '739983564830',
    projectId: 'my-flutter-mart',
    storageBucket: 'my-flutter-mart.appspot.com',
    iosClientId: '739983564830-i9dp3o1bik79acp4opcan42c38q9gke8.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterMart.RunnerTests',
  );
}
