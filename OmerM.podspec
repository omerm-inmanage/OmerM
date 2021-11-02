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
  s.frameworks = 'OmerM'
  s.source_files = 'OmerM.{h,m}'

  # s.source_files = 'OmerM' 
  # s.ios.vendored_frameworks = 'OmerM.framework'
  # s.static_framework = true
  # s.source_files = "OmerM/*.{h,m,swift}"
  # s.ios.vendored_frameworks = 'OmerM.framework'
  # s.static_framework = true
  # s.exclude_files = "Classes/Exclude"
  # s.exclude_files = "Constrictor/Constrictor/*.plist"

  #pods
  s.dependency 'Alamofire'
  s.dependency 'lottie-ios'


end
