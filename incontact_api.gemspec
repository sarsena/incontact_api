Gem::Specification.new do |s|
  s.name      = 'incontact_api'
  s.version   = '1.0'
  s.date      = '2014-01-29'
  s.summary   = 'A Ruby gem to access the InContact API'
  s.description = s.summary
  s.authors     = ['Steven Arsena']
  s.email       = 'sarsena@sjarsena.com'
  s.homepage    = 'https://github.com/sarsena/incontact_api.git'

  s.files       = ['lib/incontact_api.rb']
  

  #Dependencies
  s.add_dependency "httparty"
  s.add_dependency "faraday"
  s.add_dependency "faraday_middleware"
  s.add_dependency "json"
end