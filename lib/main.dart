import 'package:crud_firebase/pages/upd_name_page.dart';
import 'package:flutter/material.dart';

// Import the firebase_core plugin
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

// pages
import 'package:crud_firebase/pages/add_name_page.dart';
import 'package:crud_firebase/pages/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Menu',
      initialRoute: '/',
      routes: {
        '/': (context) => const Home(),
        '/add': (context) => const AddNamePage(),
        '/upd': (context) => const UpdNamePage(),
      },
    );
  }
}
