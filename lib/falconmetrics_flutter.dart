
import 'falconmetrics_flutter_platform_interface.dart';

class FalconmetricsFlutter {
  Future<String?> getPlatformVersion() {
    return FalconmetricsFlutterPlatform.instance.getPlatformVersion();
  }
}
