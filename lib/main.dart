import 'package:flutter/material.dart';
import 'package:metrics_bubble_flutter/src/service_locator.dart';
import 'src/presentations/views/home/home_wrapper.dart';

Future<void> main() async {
  runApp(const MyApp());
  // Service Locator init
  await init();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeWrapper(),
    );
  }
}
