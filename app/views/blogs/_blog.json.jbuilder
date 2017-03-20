json.extract! blogs, :id, :title, :created_at, :updated_at
json.url blog_url(blogs, format: :json)