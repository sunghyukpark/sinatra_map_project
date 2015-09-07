class Destination < ActiveRecord::Base
	has_many :directions
	has_many :origins, through: :directions	

	validates :address, presence: true
end
