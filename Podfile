# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'MobileTestMarvel' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!
  platform :ios, '12.0'

  # ignore all warnings from all dependencies
  inhibit_all_warnings!

  # Pods for MobileTestMarvel

  pod 'Mimic', '~> 1.0.0'
  pod 'Nimble'
  pod 'Kingfisher'
  pod 'RealmSwift', '~>10'
  
  target 'MobileTestMarvelTests' do
    inherit! :search_paths
    # Pods for testing
  end

  # Disable Code Coverage for Pods projects
  post_install do |installer_representation|
      installer_representation.pods_project.targets.each do |target|
         target.build_configurations.each do |config|
             config.build_settings['CLANG_ENABLE_CODE_COVERAGE'] = 'NO'
         end
     end
  end

end
