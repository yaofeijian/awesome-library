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
  s.source       = { :git => "https://github.com/yaofeijian/react-native-awesome-library.git"}
  #s.source       = { :http => "https://italkimobile.s3-us-west-2.amazonaws.com/rigel/itrncomponent/20230428023626_QA.iOS.20230428.1.zip" }

  s.source_files = "ios/**/*.{h,m,mm,swift}"
  #s.source_files = "archive/**/*.{h,m,mm,swift}"

  # React Native Core dependency
  s.dependency "React/Core"

  # The following lines are required by the New Architecture.
  s.compiler_flags = folly_compiler_flags + " -DRCT_NEW_ARCH_ENABLED=1"
  s.pod_target_xcconfig    = {
      "HEADER_SEARCH_PATHS" => "\"$(PODS_ROOT)/boost\"",
      "OTHER_CPLUSPLUSFLAGS" => "-DFOLLY_NO_CONFIG -DFOLLY_MOBILE=1 -DFOLLY_USE_LIBCPP=1",
      "CLANG_CXX_LANGUAGE_STANDARD" => "c++17"
  }

end
