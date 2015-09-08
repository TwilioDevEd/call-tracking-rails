class HomeController < ApplicationController
  def index
    @lead_sources = LeadSource.all
  end
end
