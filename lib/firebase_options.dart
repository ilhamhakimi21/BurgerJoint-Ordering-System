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
    apiKey: 'AIzaSyAK9Voijo0froq2FJefvMGWDMu5DxEUXIw',
    appId: '1:700394899971:web:c3defe44cf64b8ca0e5c36',
    messagingSenderId: '700394899971',
    projectId: 'android-burger-order',
    authDomain: 'android-burger-order.firebaseapp.com',
    storageBucket: 'android-burger-order.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyClUEr19f89SqlzrYEdKobHj05_SMoY9gM',
    appId: '1:700394899971:android:29635d9c6502da010e5c36',
    messagingSenderId: '700394899971',
    projectId: 'android-burger-order',
    storageBucket: 'android-burger-order.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBtggcvDaNidEgB_S0pMjnsAVwMBTZpt1k',
    appId: '1:700394899971:ios:b9e3741def70947b0e5c36',
    messagingSenderId: '700394899971',
    projectId: 'android-burger-order',
    storageBucket: 'android-burger-order.appspot.com',
    iosClientId: '700394899971-e9aa37kmt4d5tb70n053bkp6bdbbure0.apps.googleusercontent.com',
    iosBundleId: 'com.example.burgerOrder',
  );
}
