import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyDKhEJcNr8UgDBTCdHXQZClkUArQdanI1c",
            authDomain: "supergaletto-39fa9.firebaseapp.com",
            projectId: "supergaletto-39fa9",
            storageBucket: "supergaletto-39fa9.appspot.com",
            messagingSenderId: "1014944252911",
            appId: "1:1014944252911:web:198f60dc2f71746e6b6c1a",
            measurementId: "G-4TL2BW1FL6"));
  } else {
    await Firebase.initializeApp();
  }
}
