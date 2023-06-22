import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp/ui/pages/camera_page.dart';
import 'package:whatsapp/ui/screens/home_screen.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
 cameras = await availableCameras();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'whatsapp clone',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const HomeScreen(),
    );
  }
}