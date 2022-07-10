class Api::Cpace::V1::PropertySearchController < ApiController

  def create
    properties = Corelogic::PropertySearch.new.fetch(property_search_params)
    clip_ids = []
    properties["items"].each { |property| clip_ids << property["clip"] }
    property_details = Corelogic::PropertyDetail.new.fetch(clip_ids)
    render json: property_details
  end

  private

  def property_search_params
    params.permit(:streetAddress, :city, :state, :zipCode, :country, :apn, :countryCode)
  end

end
