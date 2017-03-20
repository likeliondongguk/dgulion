json.extract! questions, :id, :created_at, :updated_at
json.url question_url(questions, format: :json)