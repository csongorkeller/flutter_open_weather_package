import 'package:example/screens/prebuilt_widgets_demo_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

/// A simple Flutter application that demonstrates the usage of prebuilt widgets.
///
/// This widget is the root of the application and sets up the main [MaterialApp].

class MyApp extends StatelessWidget {
  /// The [MyApp] class is a stateless widget that represents the entire application.
  /// It is marked as `const` to indicate that it is immutable and can be instantiated as a compile-time constant.
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const PrebuiltWidgetsScreen(),
    );
  }
}
