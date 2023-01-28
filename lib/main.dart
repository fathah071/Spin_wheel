import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'View/HomeScreen/Home_Screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(primarySwatch: Colors.deepPurple),
    home: SpinWheel(),
  ));
}
