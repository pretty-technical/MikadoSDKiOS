
Pod::Spec.new do |s|
  s.name             = 'MikadoSDK'
  s.version          = '0.0.3'
  s.summary          = 'MikadoSDK is a software development kit (SDK) for iOS gaming apps'


  s.description      = <<-DESC
  MikadoSDK is a software development kit (SDK) for iOS gaming apps that implements the platform’s main features: login, sign up, get the game list and launch games. The SDK simplifies the development of new gaming apps and manages all the backend connections.
                       DESC

  s.homepage         = 'https://github.com/pretty-technical/MikadoSDKiOS.git'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Pretty Technical' => 'https://github.com/pretty-technical/MikadoSDKiOS.git' }
  s.source           = { :git => 'https://github.com/pretty-technical/MikadoSDKiOS.git',  :tag => "0.0.3" }
  s.ios.deployment_target = '12.1'
  s.ios.vendored_frameworks = 'MikadoSDK.framework'
  s.dependency 'Alamofire', '~> 5.2'
  s.dependency 'SwiftKeychainWrapper'
  s.swift_version = "5" 
end
