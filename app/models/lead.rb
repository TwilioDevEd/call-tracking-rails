class Lead < ActiveRecord::Base
  belongs_to :lead_source

  scope :by_city, -> (city) { where(city: city) }

  def to_str
    "#{city}, #{state}"
  end
end
