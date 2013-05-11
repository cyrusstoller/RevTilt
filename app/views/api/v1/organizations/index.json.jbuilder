json.key_format! :camelize => :lower
json.query do
  json.condition_id 0
  json.latitude params[:latitude]
  json.longitude params[:longitude]
  json.radius params[:radius]
  json.category params[:category]
  json.category_text params[:category].blank? ? "all" : Organization.category_text(params[:category].to_i)
end
json.pagination do
  json.current_page @organizations.current_page
  json.total_pages @organizations.total_pages
  json.total_entries @organizations.total_entries
end
json.organizations (@organizations) do |organization|
  json.partial! "organization", :organization =>  organization, :with_join_columns => true
end