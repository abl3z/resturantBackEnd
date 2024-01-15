import 'package:flutter/material.dart';
import 'package:resBackEnd/mainPages/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:resBackEnd/firebase_options.dart';


Future<void> main() async {
  runApp(
    Login(),
  );
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
}