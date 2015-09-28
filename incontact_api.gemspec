Gem::Specification.new do |s|
  s.name      = 'incontact_api'
  s.version   = '1.1'
  s.date      = '2015-09-28'
  s.summary   = 'A Ruby gem to access the InContact API'
  s.description = s.summary
  s.authors     = ['Steven Arsena', 'Andrew Castro']
  s.email       = 'sarsena@sjarsena.com'
  s.homepage    = 'http://rubygems.org/gems/incontact_api'

  s.files       = ['lib/incontact_api.rb']


  #Dependencies
  s.add_dependency "httparty"
  s.add_dependency "faraday"
  s.add_dependency "faraday_middleware"
  s.add_dependency "json"
end
