Pod::Spec.new do |spec|
  spec.name         = "OmegaPipe"
  spec.version      = "1.0"
  spec.summary      = "Simple, flexible MVVM protocol using Command pattern"
  spec.homepage     = "https://github.com/tokijh/OmegaPipe"
  spec.license      = { :type => "MIT", :file => "LICENCE" }
  spec.author             = { "tokijh" => "tokijh@naver.com" }
  spec.social_media_url   = "https://facebook.com/tokijh"
  spec.swift_version = '4.2'
  spec.ios.deployment_target = "8.0"
  spec.source       = { :git => "https://github.com/tokijh/OmegaPipe.git", :tag => spec.version.to_s }
  spec.source_files  = "OmegaPipe/**/*.swift"
  spec.frameworks  = "Foundation"
  spec.dependency "RxSwift", "~> 4.0.0"
end
