class LeadSourcesController < ApplicationController
  before_filter :find_lead_source

  def edit
  end

  def update
    if @lead_source.update_attributes(lead_sources_params)
      redirect_to root_url, notice: 'Lead source successfully updated.'
    end
  end

  private

  def find_lead_source
    @lead_source = LeadSource.find(params[:id])
  end

  def lead_sources_params
    params.require(:lead_source).permit(:name, :forwarding_number)
  end
end
