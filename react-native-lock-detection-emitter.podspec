require "json"

package = JSON.parse(File.read(File.join(__dir__, "package.json")))

Pod::Spec.new do |s|
  s.name         = "react-native-lock-detection-emitter"
  s.version      = package["version"]
  s.summary      = package["description"]
  s.description  = package["description"]
  s.homepage     = "https://adveez.com"
  s.license      = "MIT"
  s.author       = package["author"]
  s.platform     = :ios, "12.0"
  s.source       = { :git => "http://gitlab.adveez.com/softwareteam/react-native-lock-detection-emitter.git", :tag => "1.0.7" }
  s.source_files = "ios/**/*.{h,m}"
  s.requires_arc = true
  s.dependency "React"

end
