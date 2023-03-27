import 'package:flutter/material.dart';
import 'package:travel_app/styleguide/tr_themes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'travel_app',
      debugShowCheckedModeBanner: false,
      theme: TrThemes.lightTheme,
      darkTheme: TrThemes.darkTheme,
      home: const MyHomePage(title: 'Task: Define colors project'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Center(
        child: Text('What is my font ?'),
      ),
    );
  }
}
