import 'package:falconmetrics_flutter/falconmetrics_flutter.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final falconmetricsFlutterPlugin = FalconmetricsFlutter();
  await falconmetricsFlutterPlugin.setDebugLoggingEnabled(enabled: true);

  await falconmetricsFlutterPlugin.init(apiKey: 'myApiKey');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Plugin example app')),
        body: Center(child: Text('FalconMetrics')),
      ),
    );
  }
}
