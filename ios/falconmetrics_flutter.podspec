#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint FalconMetricsFlutter.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'falconmetrics_flutter'
  s.version          = '1.0.0'
  s.summary          = 'Flutter plugin for FalconMetrics, a comprehensive mobile app attribution solution.'
  s.description      = <<-DESC
Flutter plugin for FalconMetrics, a comprehensive mobile app attribution solution.
                       DESC
  s.homepage         = 'https://falconmetrics.io'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'FalconMetrics' => 'hello@falconmetrics.io' }
  s.source           = { :path => '.' }
  s.dependency 'Flutter'
  s.dependency 'SwiftProtobuf', '~> 1.27.0'
  s.dependency 'FalconMetrics', '1.0.1'
  s.source_files = 'falconmetrics_flutter/Sources/**/*.{swift}'
  
  s.platform = :ios, '13.0'
  s.swift_version = '5.0'
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES' }
end
