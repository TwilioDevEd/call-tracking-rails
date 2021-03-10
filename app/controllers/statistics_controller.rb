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
    {
      datasets: [{
        data: values.values,
        backgroundColor: get_colors(values.length)
      }],
      labels: values.keys
    }
  end

  def get_colors(quantity)
    colors = [
      '#eddcd2ff',
      '#fff1e6ff',
      '#fde2e4ff',
      '#fad2e1ff',
      '#c5deddff',
      '#dbe7e4ff',
      '#f0efebff',
      '#d6e2e9ff',
      '#bcd4e6ff',
      '#99c1deff',
    ]
    return colors.reverse()[0, quantity]
  end
end
