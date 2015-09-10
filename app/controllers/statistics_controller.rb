class StatisticsController < ApplicationController
  def leads_by_source
    lead_sources = LeadSource.count_leads
    render json: format_for_d3(lead_sources)
  end

  def leads_by_city
    leads = Lead.count_by_city
    render json: format_for_d3(leads)
  end

  private

  def format_for_d3(values)
    values.map do |label, value|
      {
        label: label,
        value: value
      }
    end
  end
end
