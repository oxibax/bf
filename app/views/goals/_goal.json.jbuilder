json.extract! goal, :id, :title, :description, :completed, :priority, :due_date, :created_at, :updated_at
json.url goal_url(goal, format: :json)
