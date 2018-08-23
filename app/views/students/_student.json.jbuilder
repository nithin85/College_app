json.extract! student, :id, :branch_id, :student_name, :student_address, :student_sem, :created_at, :updated_at
json.url student_url(student, format: :json)
