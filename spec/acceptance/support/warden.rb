# http://gist.github.com/549262
RSpec.configure do |config|
  config.include Warden::Test::Helpers
  config.after { Warden.test_reset! }
end
