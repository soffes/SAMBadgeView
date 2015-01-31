Pod::Spec.new do |spec|
  spec.name = 'SAMBadgeView'
  spec.version = '0.1.1'
  spec.authors = {'Sam Soffes' => 'sam@soff.es'}
  spec.homepage = 'https://github.com/soffes/SAMBadgeView'
  spec.summary = 'Draw fancy labels like Mail.app.'
  spec.source = {:git => 'https://github.com/soffes/SAMBadgeView.git', :tag => "v#{spec.version}"}
  spec.license = { :type => 'MIT', :file => 'LICENSE' }

  spec.platform = :ios
  spec.requires_arc = true
  spec.frameworks = 'UIKit', 'CoreGraphics'
  spec.source_files = 'SAMBadgeView'
end
