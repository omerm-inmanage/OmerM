Pod::Spec.new do |s|

  s.name         = "OmerM"
  s.version      = "0.0.9"
  s.summary      = "A nice logger tool in Swift."
  s.description  = <<-DESC
  A nice logger tool in Swift. Cheers
                   DESC

  s.homepage     = "https://github.com/omerm-inmanage/OmerM.git"
  s.license      = { :type => "MIT", :file => "license" }
  s.author             = { "Omer m" => "omerm@inmanage.net" }
  s.ios.deployment_target = '11.0'
  s.swift_version = '4.2'
  s.source  = {   :git => 'https://github.com/omerm-inmanage/OmerM.git', :tag => s.version.to_s  }
  s.source_files = 'OmerM' 
  s.exclude_files = "Constrictor/Constrictor/*.plist"
  s.resources = "Resources/**/*.{png,storyboard,xib,storyboard,xcassets}" 

  #pods
  s.dependency 'Alamofire'
  s.dependency 'lottie-ios'


end
