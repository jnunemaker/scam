$:.unshift(File.expand_path('../../lib', __FILE__))

require 'rubygems'
require 'bundler'

Bundler.require(:default, :development)

require 'scam'
require 'support/constants'

Rspec.configure do |config|
  config.include(Support::Constants)

  config.before(:each) do

  end
end
