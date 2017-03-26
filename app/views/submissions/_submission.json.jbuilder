json.extract! submission, :id, :title, :content, :created_at, :updated_at
json.url submission_url(submission, format: :json)