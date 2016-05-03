class Provider < ActiveRecord::Base
	has_many :programs
	has_one :location
  @@field = "id, name, website"


  def self.get(id)
    return select(@@field).find(id)
  end

  def self.getAll
    return select(@@field)
  end

end
