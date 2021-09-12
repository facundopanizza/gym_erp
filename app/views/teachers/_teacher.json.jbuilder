json.extract! teacher, :id, :first_name, :last_name, :dni, :phone_number, :birthday, :created_at, :updated_at
json.url teacher_url(teacher, format: :json)
