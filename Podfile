# platform :ios, '9.0'

target 'quick-draw-ios' do

  use_frameworks!
 
  # Pods for quick-draw-ios
  pod 'CountdownLabel', :git => 'https://github.com/suzuki-0000/CountdownLabel.git', :branch => 'master'

end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '13.0'
    end
  end
end