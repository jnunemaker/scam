$LOAD_PATH.unshift(File.expand_path('../../lib', __FILE__))
require 'pp'
require 'scam'

class FeedTemplate
  include Scam

  attr_accessor :title
end

FeedTemplate.create(:id => 1, :title => 'Twitter')
FeedTemplate.create(:id => 2, :title => 'Dribble')

pp FeedTemplate.all

# Enumerable is on the class so you can just iterate it
FeedTemplate.each do |tpl|
  pp tpl
end

# detect, select, include, etc
pp FeedTemplate.detect { |tpl| tpl.title == 'Twitter' }

# find by id
pp FeedTemplate.find(2)

# works with string id
pp FeedTemplate.find('2')