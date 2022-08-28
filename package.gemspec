Gem::Specification.new do |s|
  s.name = 'rails_med'
  s.version = '0.0.1'
  s.authors = ['MingyuanQin']
  s.email = ['mingyuan0715@foxmail.com']
  s.homepage = 'https://github.com/work-design/rails_med'
  s.summary = 'Summary of RailsMed.'
  s.description = ' Description of RailsMed.'
  s.license = 'MIT'

  s.files = Dir[
    '{app,config,db,lib}/**/*',
    'MIT-LICENSE',
    'Rakefile',
    'README.md'
  ]

  s.add_dependency 'rails_com'
end
