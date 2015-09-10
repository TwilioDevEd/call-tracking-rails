class LeadSourcesController < ApplicationController
  before_filter :find_lead_source, only: [:edit, :update]

  def edit
  end

  def create
    phone_number = params[:format]
    twilio_number = TwilioClient.purchase_phone_number(phone_number)
    lead_source = LeadSource.create(name: '', incoming_number: twilio_number.friendly_name)

    message  = "Phone number #{twilio_number.friendly_name} has been purchased. Please add a name for this lead source"
    redirect_to edit_lead_source_path(lead_source), notice: message
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
