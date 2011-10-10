class User < ActiveRecord::Base
  has_many :convos, :through => :convo_users
end
