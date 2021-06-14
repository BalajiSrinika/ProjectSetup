#
# Be sure to run `pod lib lint ProjectIntialDesigns.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'ProjectIntialDesigns'
  s.version          = '0.1.0'
  s.summary          = 'A short description of ProjectIntialDesigns.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/BalajiSrinika/ProjectIntialDesigns'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'BalajiSrinika' => 'pbalajieee@gmail.com' }
  s.source           = { :git => 'https://github.com/BalajiSrinika/ProjectIntialDesigns.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'

  s.source_files = 'ProjectIntialDesigns/Classes/**/*'
  
  s.resource_bundles = {
    'Resources' => ['ProjectIntialDesigns/*/*.{storyboard,png,xib}']
  }

 # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit'
  s.frameworks = 'Foundation'
  s.dependency 'Alamofire', '~> 4.9.1'
  s.dependency 'ObjectMapper', '~> 4.2'
  s.dependency 'IQKeyboardManagerSwift'
 
end
