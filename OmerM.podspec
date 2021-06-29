Pod::Spec.new do |s|

  s.name         = "OmerM"
  s.version      = "0.0.1"
  s.summary      = "A nice logger tool in Swift."
  s.description  = <<-DESC
  A nice logger tool in Swift. Cheers
                   DESC

  s.homepage     = "https://github.com/omerm-inmanage/OmerM.git"
  s.license      = { :type => "MIT", :file => "license" }
  s.author             = { "Omer m" => "omerm@inmanage.net" }
  s.ios.deployment_target = '8.0'
  s.ios.vendored_frameworks = 'OmerM.framework'
  s.source            = { :http => 'https://drive.google.com/file/d/1eVQJIC-Myu7fGdcdZ3DvBRtKngCFOEkR/view?usp=sharing.zip' }
  s.exclude_files = "Classes/Exclude"
  
  #pods
  s.dependency 'Alamofire'
end