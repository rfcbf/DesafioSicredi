# Uncomment the next line to define a global platform for your project
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '14.0'
inhibit_all_warnings!

target 'Sicredi' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for Sicredi
  pod 'FBValidator', :git => 'https://github.com/Felip38rito/FBValidator.git'
  pod 'FBNavigator', :git => 'https://github.com/Felip38rito/FBNavigator.git', :tag => '0.0.3'
  pod 'FBView', :git => 'https://github.com/Felip38rito/FBView.git'
  pod 'FBModel', :git => 'https://github.com/Felip38rito/FBModel.git', :tag => '0.0.10'

  target 'SicrediTests' do
    inherit! :search_paths
    # Pods for testing
    pod 'FBModel', :git => 'https://github.com/Felip38rito/FBModel.git', :tag => '0.0.10'
  end

  target 'SicrediUITests' do
    # Pods for testing
  end
  
end

post_install do |installer_representation|
  installer_representation.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['ALWAYS_EMBED_SWIFT_STANDARD_LIBRARIES'] = '$(inherited)'
    end
  end
end
