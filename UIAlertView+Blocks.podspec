Pod::Spec.new do |s|
  s.name = "UIAlertView+Blocks"
  s.summary = "Use UIAlertView with blocks instead of a delegate"
  
  s.version = "1.0.0"
  s.license = { :type => "MIT", :file => "LICENSE" }
  s.homepage = "https://github.com/zwopple/UIAlertView-Blocks"
  s.author = { "Zwopple | Creative Software" => "support@zwopple.com" }
  s.ios.deployment_target = "6.0"
  s.source = { :git => "https://github.com/zwopple/UIAlertView-Blocks.git", :tag => "1.0.0" }
  s.requires_arc = true
  s.source_files = "UIAlertView+Blocks/"
  s.frameworks = "UIKit"
  
end