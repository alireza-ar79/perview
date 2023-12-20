import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:perview/firebase.dart';
import 'package:perview/login.dart';
import 'package:perview/splash_screen.dart';
import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';
import 'about_page.dart';
import 'firebase_options.dart';
import 'home.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();

  print("Handling a background message: ${message.messageId}");
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    debugPrint('Got a message whilst in the foreground!');
    debugPrint('Message data: ${message.data}');

    if (message.notification != null) {
      debugPrint(
          'Message also contained a notification: ${message.notification}');
    }
  });

  final fcmToken = await FirebaseMessaging.instance.getToken();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  sendTokenToServer(fcmToken);

  debugPrint('fcm Token: $fcmToken');
  runApp(MyApp());
}

void sendTokenToServer(String? token) async {
  if (token != null) {
    final response = await http.post(
      Uri.parse('https://alirezaarbabi.wiki/ESP32CAM/save_token.php'), // Replace with your server endpoint
      body: {'token': token},
    );

    print('توکن مربوطه: $token');

    if (response.statusCode == 200) {
      print('Token sent to server successfully');
    } else {
      print('Failed to send token to server');
    }
  }
}



// void main() {
//   WidgetsFlutterBinding.ensureInitialized();
//   OneSignal.Debug.setLogLevel(OSLogLevel.verbose);
//   OneSignal.initialize('9c786632-de77-4ba9-83a4-0b2834b90f81');
//   OneSignal.Notifications.requestPermission(true);
//   runApp(MyApp());
// }

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      darkTheme: ThemeData(appBarTheme: const AppBarTheme(backgroundColor:Colors.white)),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      routes: {
        '/login': (context) => const Login(),
        '/home': (context) => HomePage(),
        '/about': (context) => const AboutPage(),
        '/firebase': (context) => FirebaseCheck(),
      },
    );
  }
}
