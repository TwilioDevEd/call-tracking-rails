class Lead < ActiveRecord::Base
  belongs_to :lead_source

  def self.count_by_city
    group(:city).count
  end

  def to_str
    "#{city}, #{state}"
  end
end
