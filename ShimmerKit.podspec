Pod::Spec.new do |spec|
  spec.name         = "ShimmerKit"
  spec.version      = "0.1.0"
  spec.summary      = "Library for quickly creating shimmer effects."
  
  spec.platform = :ios, '9.0'
  spec.swift_version = '4.1'
  
  spec.description  = "Library for quickly creating shimmer effects for iOS."

  spec.homepage     = "https://github.com/ilyaglob/ShimmerKit"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author       = { "Razumov" => "ilya_glob@mail.ru" }

  spec.source       = { :git => "https://github.com/ilyaglob/ShimmerKit.git", :tag => "#{spec.version}" }
  spec.source_files      = "ShimmerKit/**/*.{h,m,swift}"

end
