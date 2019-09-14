Pod::Spec.new do |s|

  s.name         = "LhHelpers"
  s.version      = "2.0.0"
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
