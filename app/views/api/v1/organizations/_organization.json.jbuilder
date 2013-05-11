json.name organization.name
json.revtilt_url organization_url(organization)
json.category_id organization.category_id
json.category_text organization.category_text
json.review_summary do
  json.num_reviews begin organization.cache_review_stats.with_condition(0).first.num_reviews rescue 0 end
  json.avg_review begin organization.cache_review_stats.with_condition(0).first.avg_review rescue 0 end
end
json.location do
  json.latitude organization.latitude
  json.longitude organization.longitude
  json.display_location organization.display_location
end
json.url organization.url
json.url_type organization.url_type
json.homepage organization.homepage_url || ""