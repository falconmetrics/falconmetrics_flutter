import 'package:falconmetrics_flutter/falconmetrics_flutter.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

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
  String _idfa = '';
  TrackingAuthorizationStatus _trackingAuthorizationStatus =
      TrackingAuthorizationStatus.notDetermined;

  @override
  void initState() {
    super.initState();

    SchedulerBinding.instance.addPostFrameCallback((_) {
      if (defaultTargetPlatform == TargetPlatform.iOS) {
        _getTrackingAuthorizationStatus();
        _getIdfa();
      }
    });
  }

  void _trackEvent() {
    widget.falconmetricsFlutter.trackEvent(
      event: const PurchaseEvent(
        itemIds: ['habit'],
        quantity: 1,
        transactionId: 'habit',
        productPriceInCents: 2000,
        currency: 'USD',
        revenueInCents: 2000,
      ),
      userData: UserData(email: 'foo@bar.com'),
    );
    setState(() {
      _result = 'Event tracked!';
    });
  }

  Future<void> _getTrackingAuthorizationStatus() async {
    final status =
        await widget.falconmetricsFlutter.getTrackingAuthorizationStatus();
    setState(() {
      _trackingAuthorizationStatus = status;
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

  Future<void> _requestIDFA() async {
    final status = await widget.falconmetricsFlutter.requestIDFA();
    setState(() {
      _trackingAuthorizationStatus = status;
    });
  }

  Future<void> _getIdfa() async {
    final idfa = await widget.falconmetricsFlutter.getIDFA();
    setState(() {
      _idfa = idfa ?? 'IDFA not available';
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
              if (defaultTargetPlatform == TargetPlatform.iOS) ...[
                FilledButton(
                  onPressed: () {
                    _getTrackingAuthorizationStatus();
                  },
                  child: const Text('Get ATT authorization status'),
                ),
                const SizedBox(height: 20),
                FilledButton(
                  onPressed: () {
                    _requestIDFA();
                  },
                  child: const Text('Request ATT'),
                ),
                const SizedBox(height: 20),
                FilledButton(
                  onPressed: () {
                    _getIdfa();
                  },
                  child: const Text('Get IDFA'),
                ),
              ],
              const Spacer(),
              Container(
                height: 300,
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
                      const SizedBox(height: 8),
                      Text('Tracking is enabled: $_isTrackingEnabled'),
                      if (defaultTargetPlatform == TargetPlatform.iOS) ...[
                        const SizedBox(height: 8),
                        Text(
                          'ATT status: ${_trackingAuthorizationStatus.name}',
                        ),
                        const SizedBox(height: 8),
                        Text('IDFA: $_idfa'),
                      ],
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
