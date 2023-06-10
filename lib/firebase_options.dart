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
    apiKey: 'AIzaSyAq6DoOJCi5_0TglLWP3nSlt1ExRvIZ5vo',
    appId: '1:1006364124183:android:fc5611ff8bfd0aee8d6852',
    messagingSenderId: '1006364124183',
    projectId: 'zaheed-d96af',
    databaseURL: 'https://zaheed-d96af-default-rtdb.firebaseio.com',
    storageBucket: 'zaheed-d96af.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBhZ8j8GpQyme9-CRhnOwHU9JumRNTRFJ8',
    appId: '1:1006364124183:ios:c52960c28dee2c608d6852',
    messagingSenderId: '1006364124183',
    projectId: 'zaheed-d96af',
    databaseURL: 'https://zaheed-d96af-default-rtdb.firebaseio.com',
    storageBucket: 'zaheed-d96af.appspot.com',
    iosClientId: '1006364124183-8cc2b1dm45l7kfhokndbji4rgjofgtvi.apps.googleusercontent.com',
    iosBundleId: 'com.bestcoders.zaheed',
  );
}
