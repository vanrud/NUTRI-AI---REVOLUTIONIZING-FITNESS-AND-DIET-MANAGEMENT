import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAKI6tfvMD2fSQTt23LciJ4rId1ZPrVHC8",
            authDomain: "meal-p2mj0v.firebaseapp.com",
            projectId: "meal-p2mj0v",
            storageBucket: "meal-p2mj0v.appspot.com",
            messagingSenderId: "749503706912",
            appId: "1:749503706912:web:9d27066eb9099548354945",
            measurementId: "G-HZ8TH75QVT"));
  } else {
    await Firebase.initializeApp();
  }
}
