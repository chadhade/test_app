class Debate < ActiveRecord::Base
	validates :length, :presence => true
end
