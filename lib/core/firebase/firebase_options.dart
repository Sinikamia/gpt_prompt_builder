import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAgTm-RSn1GeMUfwFLWm70ZsBOcMftfZ_Q',
    appId: '1:802881339368:android:e1f18e933c18aef94aae5d',
    messagingSenderId: '802881339368',
    projectId: 'gptpromptbuilder-af374',
    storageBucket: 'gptpromptbuilder-af374.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAjyvwRnZYb71R_pu9K5qYLuFMxk1AKyF0',
    appId: '1:802881339368:ios:c76fbc7fc5d4d1434aae5d',
    messagingSenderId: '802881339368',
    projectId: 'gptpromptbuilder-af374',
    storageBucket: 'gptpromptbuilder-af374.firebasestorage.app',
    iosBundleId: 'com.example.gptPromptBuilder',
  );

}