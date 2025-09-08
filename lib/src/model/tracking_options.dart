import 'package:equatable/equatable.dart';

/// Tracking options that can be set when initialising the FalconMetrics sdk
class TrackingOptions extends Equatable {
  const TrackingOptions({this.ipAddressTracking = IpAddressTracking.full});

  /// Settings for IP address tracking
  final IpAddressTracking? ipAddressTracking;

  @override
  List<Object?> get props => [ipAddressTracking];
}

/// Settings for IP address tracking
enum IpAddressTracking {
  /// Full IP address tracking
  full,

  /// Anonymised IP address tracking
  anonymised,

  /// IP address tracking disabled
  disabled,
}
