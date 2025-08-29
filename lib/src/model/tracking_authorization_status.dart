/// The Authorization Status of the user for tracking using AppTrackingTransparency
enum TrackingAuthorizationStatus {
  /// The Authorization Status is not determined and the user has not been asked for permission
  notDetermined,

  /// This means that the device does not prompt for tracking authorization when
  /// AppTrackingTransparency permission is requested.
  restricted,

  /// The user denied the permission to access app-related data for tracking the user or the device.
  denied,

  /// The user authorized the permission to access app-related data for tracking the user or the device.
  authorized,
}
