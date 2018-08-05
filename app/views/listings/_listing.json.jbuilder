json.extract! listing, :id, :listing_code, :creative_name, :ad_name, :ad_parameter, :kahen_selector, :created_at, :updated_at, :on_off
json.url listing_url(listing, format: :json)
