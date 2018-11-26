#
#  Be sure to run `pod spec lint LhHelpers.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  # ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  These will help people to find your library, and whilst it
  #  can feel like a chore to fill in it's definitely to your advantage. The
  #  summary should be tweet-length, and the description more in depth.
  #

  s.name         = "LhHelpers"
  s.version      = "1.1.0"
  s.summary      = "LhHelpers is a pod full of helper functions and other goodies for iOS apps to use"
  s.description  = <<-DESC
	This pod has helpers for iOS app development. It currently has helpers for alerts, colors, view controllers, and dates. 
                   DESC

  s.homepage     = "https://github.com/letshangllc/helpers"
  # s.screenshots  = "www.example.com/screenshots_1.gif", "www.example.com/screenshots_2.gif"


  # ―――  Spec License  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Licensing your code is important. See http://choosealicense.com for more info.
  #  CocoaPods will detect a license file if there is a named LICENSE*
  #  Popular ones are 'MIT', 'BSD' and 'Apache License, Version 2.0'.
  #

  s.license = { :type => 'MIT', :file => 'LICENSE.txt' }

  s.author             = { "Chase Burnham" => "cburnham@letshang.us" }

  s.platform     = :ios, '10.3'
  s.swift_version = "4.2"
  s.source       = { :git => "https://github.com/letshangllc/helpers.git", :tag => "#{s.version}" }
  s.source_files  = "lh-helpers", "lh-helpers/**/*.{h,m,swift}"
  s.exclude_files = "Classes/Exclude"

end
