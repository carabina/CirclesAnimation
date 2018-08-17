Pod::Spec.new do |s|
          #1.
          s.name               = "CirclesAnimation"
          #2.
          s.version            = "1.0.0"
          #3.  
          s.summary            = " Various animations with circles. 'CirclesAnimation'"
          #4.
	  s.description        = <<-DESC. If you need different animations with circles, you can use CirclesAnimation.
   DESC      
          #5.
          s.homepage           = "https://github.com/Kondzhariia/CirclesAnimation.git"
          #6.
          s.license            = { :type => 'MIT', :file => 'LICENSE' }
          #7.
          s.author             = { 'Kondzhariia' => 'data@eltexsoft.com' }
          #8.
          s.platform           = :ios, "10.0"
          #9.
          s.source             = { :git => 'https://github.com/Kondzhariia/CirclesAnimation.git', :tag => s.version.to_s }
          #10.
          s.source_files       = "CirclesAnimation", "CirclesAnimation/**/*.{h,m,swift}"
	  #11.
          s.swift_version = '4.1'
    end