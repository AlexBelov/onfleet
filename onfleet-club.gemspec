Gem::Specification.new do |s|
  s.name        = 'onfleet-club'
  s.version     = '0.1.4'
  s.date        = '2016-04-08'
  s.summary     = "OnfleetClub ruby api"
  s.description = "To interact with OnfleetClub's API"
  s.authors     = ["Nick Wargnier"]
  s.email       = 'nick@stylelend.com'
  s.homepage    = 'http://rubygems.org/gems/onfleet-club'
  s.license     = 'MIT'

  s.add_dependency('rest-client', '~> 2.0.1')

  s.add_development_dependency("rspec",'~> 3.3.0', '>= 3.0.0')


  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_paths = ['lib']
end