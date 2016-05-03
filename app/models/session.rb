class Session < ActiveRecord::Base
	has_one :location
  belongs_to :program

  @@fields = "id, start_date, end_date, description,location_id, capacity, program_id, start_time_of_day, end_time_of_day, duration, price, prerequisite, currency_code, price_details"

  def self.get(id)
    return select(@@fields).find(id)
  end
end
