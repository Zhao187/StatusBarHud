Pod::Spec.new do |spec|

  spec.name         = "IOSStatusBarHud"
  spec.version      = "0.0.1"
  spec.summary      = "The fastest toolbar, can display a variety of prompt message" 
  spec.homepage     = "https://github.com/Zhao187/StatusBarHud"
  spec.license      = "MIT"
  spec.author             = { "Steven" => "865691337@qq.com" }
  spec.social_media_url   = "http://39.106.130.249:8080/blog/"
  spec.source       = { :git => "https://github.com/Zhao187/StatusBarHud.git", :tag => spec.version }
  spec.source_files  = "StatusBarHUD"
  spec.requires_arc = true 
  spec.ios.deployment_target = '5.0'
	
end
