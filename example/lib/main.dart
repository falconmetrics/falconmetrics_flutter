import 'package:falconmetrics_flutter/falconmetrics_flutter.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final falconmetricsFlutterPlugin = FalconmetricsFlutter();
  await falconmetricsFlutterPlugin.setDebugLoggingEnabled(enabled: true);

  await falconmetricsFlutterPlugin.init(apiKey: 'myApiKey');

  runApp(MyApp(falconmetricsFlutter: falconmetricsFlutterPlugin));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.falconmetricsFlutter});

  final FalconmetricsFlutter falconmetricsFlutter;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Plugin example app')),
        body: Column(
          children: [
            Text(
              'FalconMetrics',
              style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            TextButton(
              onPressed: () {
                falconmetricsFlutter.trackEvent(
                  event: const CompleteRegistrationEvent(),
                );
              },
              child: const Text('Track event'),
            ),
          ],
        ),
      ),
    );
  }
}
