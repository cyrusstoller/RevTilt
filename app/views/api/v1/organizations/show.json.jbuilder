json.key_format! :camelize => :lower
json.condition_id 0
json.organization do
  json.partial! @organization
end
json.pagination do
  json.current_page @reviews.current_page
  json.total_pages @reviews.total_pages
  json.total_entries @reviews.total_entries
end
json.reviews (@reviews) do |review|
  json.partial! review
end