# Keep Flutter plugin classes and ensure they're accessible to GeneratedPluginRegistrant
-keep public class io.falconmetrics.falconmetrics_flutter.** { *; }
-keep public class io.falconmetrics.falconmetrics_flutter.FalconmetricsFlutterPlugin { *; }
-keepnames public class io.falconmetrics.falconmetrics_flutter.FalconmetricsFlutterPlugin
-keep class io.falconmetrics.falconmetrics_flutter.FalconmetricsFlutterPlugin

# Keep Protobuf classes
-keep class * extends com.google.protobuf.GeneratedMessageLite { *; }

# Prevent obfuscation of Kotlin classes
-keepclassmembers class **$WhenMappings {
    <fields>;
}
-keepclassmembers class kotlin.Metadata {
    public <methods>;
}
-keepattributes *Annotation*,Signature,InnerClasses
