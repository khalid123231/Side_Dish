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
    apiKey: 'AIzaSyBB0SRKSD7a3Ad7AwgrRv_BPobbwphfK7Q',
    appId: '1:1036355081414:web:f34e40bc85ea6c7ce933c7',
    messagingSenderId: '1036355081414',
    projectId: 'side-dish-756b7',
    authDomain: 'side-dish-756b7.firebaseapp.com',
    storageBucket: 'side-dish-756b7.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA17NwGvy5m4nbt9Gtmp1RcmbubFjxbhXE',
    appId: '1:1036355081414:android:e27cc9f1f7db87d2e933c7',
    messagingSenderId: '1036355081414',
    projectId: 'side-dish-756b7',
    storageBucket: 'side-dish-756b7.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBASeSszR_sxWxGE_0lKqjyVx3qzyzbriE',
    appId: '1:1036355081414:ios:264d32349d87b848e933c7',
    messagingSenderId: '1036355081414',
    projectId: 'side-dish-756b7',
    storageBucket: 'side-dish-756b7.appspot.com',
    iosBundleId: 'com.example.foodDeliveryAppV3',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBASeSszR_sxWxGE_0lKqjyVx3qzyzbriE',
    appId: '1:1036355081414:ios:00f167301d3bd75ce933c7',
    messagingSenderId: '1036355081414',
    projectId: 'side-dish-756b7',
    storageBucket: 'side-dish-756b7.appspot.com',
    iosBundleId: 'com.example.foodDeliveryAppV3.RunnerTests',
  );
}
