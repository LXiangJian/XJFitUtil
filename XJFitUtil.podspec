Pod::Spec.new do |s|
  s.name             = "XJFitUtil"
  s.version          = "1.2.0"
  s.summary          = "A util for fit encode and decode on iOS."
  s.description      = <<-DESC
                       It is a util for encoding and decoding fit files used on iOS, which implement by Objective-C and C++.
                       DESC
  s.license          = 'MIT'
  s.homepage     = "https://github.com/LXiangJian"
  s.author             = { "Lxiangjian" => "liuxiangjian@miriding.com" }
  s.source           = { :git => "https://github.com/LXiangJian/XJFitUtil.git", :tag => s.version}

  s.platform     = :ios
  s.requires_arc = true

  s.source_files = "XJFitUtil/*.{h,mm,hpp,cpp}"  

  s.libraries    ='FitSdkCppiOS'

end