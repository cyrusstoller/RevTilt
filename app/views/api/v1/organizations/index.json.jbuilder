json.key_format! :camelize => :lower
json.condition_id 0
json.pagination do
  json.current_page @organizations.current_page
  json.total_pages @organizations.total_pages
  json.total_entries @organizations.total_entries
end
json.organizations (@organizations) do |organization|
  json.partial! "organization", :organization =>  organization, :with_join_columns => true
end