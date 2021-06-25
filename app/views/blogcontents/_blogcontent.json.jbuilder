json.extract! blogcontent, :id, :content, :user_id, :created_at, :updated_at
json.url blogcontent_url(blogcontent, format: :json)
