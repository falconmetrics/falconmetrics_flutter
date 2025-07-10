import 'package:falconmetrics_flutter/falconmetrics_flutter.dart';
import 'package:falconmetrics_flutter_example/main.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Shows app', (WidgetTester tester) async {
    await tester.pumpWidget(
      MyApp(falconmetricsFlutter: FalconmetricsFlutter()),
    );
    expect(find.byType(MyApp), findsOneWidget);
  });
}
