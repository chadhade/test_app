class Convo < ActiveRecord::Base
  has_many :users, :through => :convo_users
end
