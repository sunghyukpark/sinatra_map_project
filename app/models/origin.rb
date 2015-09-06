class Origin < ActiveRecord::Base
	has_many :directions
	has_many :destinations, through: :directions	

	validates :name, presence: true
	validates :address, presence: true
end
