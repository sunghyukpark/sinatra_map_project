class Direction < ActiveRecord::Base
	belongs_to :origin
	belongs_to :destionation
	belongs_to :user
end
