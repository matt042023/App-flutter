import 'package:flutter/material.dart';
import 'package:scratch/pages/form_page.dart';
import 'package:scratch/pages/homePage.dart';
import 'package:scratch/pages/welcomePage.dart';


void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
        routes: {
          '/':(context) => const HomePage(),
          '/form': (context) => const FormPage()
        }
        );
  }
}





