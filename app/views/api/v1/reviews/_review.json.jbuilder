json.key_format! :camelize => :lower
json.username review.user.username rescue "N/A"
json.rating review.rating
json.content simple_format(review.content)
json.created_at review.created_at