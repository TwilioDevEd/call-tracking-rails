class DashboardController < ApplicationController
  def index
    @lead_sources = LeadSource.all
  end
end
