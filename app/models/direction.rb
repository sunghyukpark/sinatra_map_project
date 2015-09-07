class Direction < ActiveRecord::Base
	belongs_to :origin
	belongs_to :destination
	belongs_to :user
end
