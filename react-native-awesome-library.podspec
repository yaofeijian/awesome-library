require "json"

package = JSON.parse(File.read(File.join(__dir__, "package.json")))
folly_compiler_flags = '-DFOLLY_NO_CONFIG -DFOLLY_MOBILE=1 -DFOLLY_USE_LIBCPP=1 -Wno-comma -Wno-shorten-64-to-32'

Pod::Spec.new do |s|
  s.name         = "react-native-awesome-library"
  s.version      = package["version"]
  s.summary      = package["description"]
  s.homepage     = package["homepage"]
  s.license      = package["license"]
  s.authors      = package["author"]

  s.platforms    = { :ios => "11.0" }
  s.source       = { :git => "https://github.com/yaofeijian/react-native-awesome-library.git" }
  #s.source       = { :http => "https://italkimobile.s3-us-west-2.amazonaws.com/rigel/itrncomponent/20230428023626_QA.iOS.20230428.1.zip" }

  s.source_files = "ios/**/*.{h,m,mm,swift}"
  #s.source_files = "archive/**/*.{h,m,mm,swift}"

  # Use install_modules_dependencies helper to install the dependencies if React Native version >=0.71.0.
  # See https://github.com/facebook/react-native/blob/febf6b7f33fdb4904669f99d795eba4c0f95d7bf/scripts/cocoapods/new_architecture.rb#L79.  

  if respond_to?(:install_modules_dependencies, true)
    install_modules_dependencies(s)
  else
  # s.dependency 'React-Core'
  s.dependency  "ITRNComponent", :http=>"https://italkimobile.s3-us-west-2.amazonaws.com/rigel/itrncomponent/20230428023626_QA.iOS.20230428.1.zip"
  end   
end
