class Corelogic::PropertySearch < Corelogic::BaseApi

  @@url = "#{ENV["CORELOGIC_BASE_API"]}/v2/properties/search"

  def fetch property_search_request
    search_url = @@url
    query_params = property_search_request.to_query
    search_url = [search_url, query_params].compact.join('?')
    resp = self.execute(:get, search_url, {})
    return JSON.parse(resp.body)
  end

end
