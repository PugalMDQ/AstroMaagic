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
    apiKey: 'AIzaSyBZ3qY3VLeZ8jeWgCmk0AWGyZUiORAMsPI',
    appId: '1:387897822714:web:52782e2a1ce0e348ebe843',
    messagingSenderId: '387897822714',
    projectId: 'astro-4f278',
    authDomain: 'astro-4f278.firebaseapp.com',
    storageBucket: 'astro-4f278.appspot.com',
    measurementId: 'G-EZTZMPTMKM',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCoJHv9cg6lJqkkwookJ2U0YwGTZswim_k',
    appId: '1:387897822714:android:02810872292fb854ebe843',
    messagingSenderId: '387897822714',
    projectId: 'astro-4f278',
    storageBucket: 'astro-4f278.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDDc7BzKEcM7G5GTaOFykawbzuheY7hjzY',
    appId: '1:387897822714:ios:f2656e1e47d5eb97ebe843',
    messagingSenderId: '387897822714',
    projectId: 'astro-4f278',
    storageBucket: 'astro-4f278.appspot.com',
    iosBundleId: 'com.mdq.astromaagic',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDDc7BzKEcM7G5GTaOFykawbzuheY7hjzY',
    appId: '1:387897822714:ios:f2656e1e47d5eb97ebe843',
    messagingSenderId: '387897822714',
    projectId: 'astro-4f278',
    storageBucket: 'astro-4f278.appspot.com',
    iosBundleId: 'com.mdq.astromaagic',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBZ3qY3VLeZ8jeWgCmk0AWGyZUiORAMsPI',
    appId: '1:387897822714:web:7923f5942214437cebe843',
    messagingSenderId: '387897822714',
    projectId: 'astro-4f278',
    authDomain: 'astro-4f278.firebaseapp.com',
    storageBucket: 'astro-4f278.appspot.com',
    measurementId: 'G-02ZVZHJ7CB',
  );
}