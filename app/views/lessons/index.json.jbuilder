json.array!(@lessons) do |lesson|
  json.extract! lesson, :id, :title, :grade, :subject, :state, :ese, :standards
  json.url lesson_url(lesson, format: :json)
end
