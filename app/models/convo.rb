class Convo < ActiveRecord::Base
  has_many :convo_users
  has_many :users, :through => :convo_users
  has_many :posts
end
