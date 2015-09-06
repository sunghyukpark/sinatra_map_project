class Destination < ActiveRecord::Base
	has_many :directions
	has_many :origins, through: :directions	

	# validates :name, presence: true
	# validates :address, presence: true
end
