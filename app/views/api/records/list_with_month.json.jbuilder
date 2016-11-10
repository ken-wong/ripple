json.list do
  json.array! @dates.each do |date|
    json.date date
    json.projects Project.where(id: @records.where(date: date).pluck(:project_id)).pluck(:name)
  end
end