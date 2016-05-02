class Provider < ActiveRecord::Base
	has_many :programs
	has_one :location
end
