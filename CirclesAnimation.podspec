Pod::Spec.new do |s|
          #1.
          s.name               = "CirclesAnimation"
          #2.
          s.version            = "1.0.0"
          #3.  
          s.summary            = " Various animations with circles. 'CirclesAnimation'"
          #4.
          s.homepage           = "https://github.com/Kondzhariia/CirclesAnimation.git"
          #5.
          s.license            = "MIT"
          #6.
          s.author             = "Data K"
          #7.
          s.platform           = :ios, "10.0"
          #8.
          s.source             = { :git => "https://github.com/Kondzhariia/CirclesAnimation.git", :tag => "1.0.0" }
          #9.
          s.source_files       = "CirclesAnimation", "CirclesAnimation/**/*.{h,m,swift}"
    end