$LOAD_PATH.unshift(File.expand_path('../../lib', __FILE__))
require 'pp'
require 'scam'

class FeedTemplate
  include Scam

  sorted_by :title

  attr_accessor :title
end

FeedTemplate.create(:id => 1, :title => 'Twitter')
FeedTemplate.create(:id => 2, :title => 'Dribble')

# Sorted by title instead of id so dribble will be first and twitter second
pp FeedTemplate.all
