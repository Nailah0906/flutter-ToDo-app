import 'package:flutter/material.dart';
import '../screens/auth_gate.dart';
import 'package:provider/provider.dart';
import 'providers/auth_notifier.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await Firebase.initializeApp();
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AuthNotifier(),
      child: const MaterialApp(
        home: AuthGate(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}