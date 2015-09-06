class Direction < ActiveRecord::Base
	has_one :destination
	has_one :origin
	belongs_to :user
end
