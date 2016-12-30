json.list do
  json.array! @dates.each do |date|
    json.date date
    @record_with_date = @records.where(date: date)
    json.records do
      json.array!  @record_with_date do |record|
        json.name record.project.name
        json.hour record.hour
        json.remark record.remark ? record.remark : ""
      end
    end
  end
end