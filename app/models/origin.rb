class Origin < ActiveRecord::Base
	has_many :directions
	has_many :destinations, through: :directions	

	validates :address, presence: true
end
