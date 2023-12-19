import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'firebase_options.dart';

class FirebaseCheck extends StatelessWidget {
  final Future <FirebaseApp> firebasetest = Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: firebasetest,
      builder: (context,snapshot) {
        if(snapshot.hasError)
        {
          return const Scaffold(
            body: Center(child: Text('Firebase is not connected'),),
          );
        }

        if(snapshot.connectionState==ConnectionState.done)
        {
          return const Scaffold(
            body: Center(child: Text('Firebase is connected'),),
          );
        }
        return const CircularProgressIndicator();
      },

    );
  }
}