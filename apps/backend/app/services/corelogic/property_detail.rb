class Corelogic::PropertyDetail < Corelogic::BaseApi

  @@url = "#{ENV["CORELOGIC_BASE_API"]}/v2/properties/%s/property-detail"

  def fetch clip_ids
    search_url = @@url
    results = {}
    clip_ids.each do |clip_id|
      search_url = search_url % [clip_id]
      resp = self.execute(:get, search_url, {})
      results[clip_id] = JSON.parse(resp.body)
    end
    return results
  end

end
