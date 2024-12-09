import 'package:android_studio/ui/screens/add_company.dart';
import 'package:android_studio/ui/screens/home.dart';
import 'package:android_studio/ui/screens/search_address.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Home(),
      routes: {
        '/home' : (context) => const Home(),
        '/add_company': (context) => const AddCompany(),
        '/search_address' : (context) => const SearchAddress()
      }

    );
  }
}

