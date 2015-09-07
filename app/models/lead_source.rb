class LeadSource < ActiveRecord::Base
  has_many :leads

  def to_str
    "#{name || "(no yet named)"} - #{incoming_number}"
  end
end
