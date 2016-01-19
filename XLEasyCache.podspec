#
# Be sure to run `pod lib lint XLEasyCache.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "XLEasyCache"
  s.version          = "0.1.0"
  s.summary          = "封装UserCache和CommonCache 添加基本类型键值保存."

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!  
  s.description      = <<-DESC
            添加TXUserCache和TXCommonCache类，并添加基本类型 TXCache+TXBaseType
                       DESC

  s.homepage         = "https://github.com/randyeasy/XLEasyCache"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "randy" => "ouyaliang@163.com" }
  s.source           = { :git => "https://github.com/randyeasy/XLEasyCache.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.platform     = :ios, '6.1'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/*'

  s.public_header_files = ['Pod/Classes/XLECache.h', 'Pod/Classes/XLECache+XLEBaseType.h', 'Pod/Classes/XLECommonCache.h', 'Pod/Classes/XLEUserCache.h', 'Pod/Classes/XLEasyCache.h']
  s.dependency 'TMCache', '~> 1.2'
end
