class StatisticsController < ApplicationController
  def leads_by_source
    lead_sources = LeadSource.count_leads
    render json: format_for_chart(lead_sources)
  end

  def leads_by_city
    leads = Lead.count_by_city
    render json: format_for_chart(leads)
  end

  private

  def format_for_chart(values)
    values.map do |label, value|
      {
        label: label,
        value: value
      }
    end
  end
end
