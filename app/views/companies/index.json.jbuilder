json.array!(@companies) do |company|
  json.extract! company, :id, :name, :rating, :domain, :description, :logo_url, :policy_url
  json.url company_url(company, format: :json)
end
