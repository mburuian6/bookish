json.extract! pdf, :id, :title, :last_accessed, :current_page, :created_at, :updated_at
json.url pdf_url(pdf, format: :json)
