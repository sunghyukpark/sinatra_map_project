class Origin < ActiveRecord::Base

	belongs_to :direction

	validates :name, presence: true
	validates :address, presence: true

end
