import 'package:falconmetrics_flutter/falconmetrics_flutter.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final falconmetricsFlutterPlugin = FalconmetricsFlutter();
  await falconmetricsFlutterPlugin.setDebugLoggingEnabled(enabled: true);

  await falconmetricsFlutterPlugin.init(apiKey: 'myApiKey');

  runApp(MyApp(falconmetricsFlutter: falconmetricsFlutterPlugin));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key, required this.falconmetricsFlutter});

  final FalconmetricsFlutter falconmetricsFlutter;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _result = '';
  bool _isTrackingEnabled = true;

  void _trackEvent() {
    widget.falconmetricsFlutter.trackEvent(
      event: const CompleteRegistrationEvent(),
    );
    setState(() {
      _result = 'Event tracked!';
    });
  }

  Future<void> _enableDisableTracking() async {
    await widget.falconmetricsFlutter.setTrackingEnabled(
      enabled: !_isTrackingEnabled,
    );

    final result = await widget.falconmetricsFlutter.isTrackingEnabled();
    setState(() {
      _isTrackingEnabled = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('FalconMetrics'), centerTitle: true),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 20),
              FilledButton(
                onPressed: () {
                  _trackEvent();
                },
                child: const Text('Track event'),
              ),
              const SizedBox(height: 16),
              FilledButton(
                onPressed: () {
                  _enableDisableTracking();
                },
                child: Text(
                  _isTrackingEnabled ? 'Disable tracking' : 'Enable tracking',
                ),
              ),
              const SizedBox(height: 20),
              const Spacer(),
              Container(
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: Theme.of(context).colorScheme.primary,
                    width: 1,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Center(child: Text('Execute an action:')),
                      const SizedBox(height: 24),
                      Text(_result),
                      const SizedBox(height: 24),
                      Text('Tracking is enabled: $_isTrackingEnabled'),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 80),
            ],
          ),
        ),
      ),
    );
  }
}
