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
  # s.ios.vendored_frameworks = 'OmerM.framework'

  s.exclude_files = "Constrictor/Constrictor/*.plist"
  # s.static_framework = true
  # s.requires_arc = true

  s.xcconfig = { 'CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES' => 'YES',
  'ENABLE_BITCODE' => 'YES'
  }
  # s.source_files = 'OmerM' ֿ
  s.source_files = 'OmerM/Main/**/*'
  # s.source_files = 'OmerM/APi/**/*'
  # s.source_files = 'OmerM/Extenstions/**/*'
  # s.source_files = 'OmerM/GUI/**/*'
  # s.source_files = 'OmerM/Objects/**/*'
  # s.source_files = 'OmerM/Protocols/**/*'
  # s.source_files = 'OmerM/Protocols/**/*'
  # s.source_files = 'OmerM/Resources/**/*'
  # s.source_files = 'OmerM/Validators/**/*'

  #pods
  s.dependency 'Alamofire'
  s.dependency 'lottie-ios'


end
