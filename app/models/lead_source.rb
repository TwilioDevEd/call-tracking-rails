class LeadSource < ActiveRecord::Base
  has_many :leads

  def self.count_leads
    joins(:leads).group(:name).order(:name).count
  end

  def to_str
    "#{name || "(no yet named)"} - #{incoming_number}"
  end
end
