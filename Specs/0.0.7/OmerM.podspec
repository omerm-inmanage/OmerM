Pod::Spec.new do |s|

  s.name         = "OmerM"
  s.version      = "0.0.7"
  s.summary      = "A nice logger tool in Swift."
  s.description  = <<-DESC
  A nice logger tool in Swift. Cheers
                   DESC

  s.homepage     = "https://github.com/omerm-inmanage/OmerM.git"
  s.license      = { :type => "MIT", :file => "license" }
  s.author             = { "Omer m" => "omerm@inmanage.net" }
  s.ios.deployment_target = '11.0'
  s.frameworks = 'OmerM'
  s.static_framework = true
  s.source  = {   :git => 'https://github.com/omerm-inmanage/OmerM.git', :tag => s.version.to_s  }

  # s.exclude_files = "Classes/Exclude"
  s.swift_version = '4.2'
  s.exclude_files = "Constrictor/Constrictor/*.plist"


  #pods
  s.dependency 'Alamofire'
  s.dependency 'lottie-ios'


end
