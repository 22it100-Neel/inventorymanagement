import 'package:flutter/material.dart';
import 'package:inventory/screens/dashboard_screen.dart';
import 'package:inventory/screens/login_screen.dart';
import 'package:inventory/screens/materials_screen.dart';
import 'package:inventory/screens/cost_report_screen.dart';
import 'package:inventory/screens/scan_screen.dart';
import 'package:inventory/theme/app_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize Firebase with explicit options
  try {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyBkQaNFqd_IsvC7Ltd1mzdzOf8D9_OVmOA",
        authDomain: "inventory-42bcd.firebaseapp.com",
        appId: "1:1094355807565:android:27a1ce1e9d9febdfb81b04",
        messagingSenderId: "1094355807565",
        projectId: "inventory-42bcd",
        storageBucket: "inventory-42bcd.firebasestorage.app",
      ),
    );
  } catch (e) {
    debugPrint('Error initializing Firebase: $e');
  }

  // Set preferred orientations
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SmartFab Inventory',
      theme: AppTheme.darkTheme,
      home: const LoginScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
