namespace :fix do
  task :hour => :environment do
    User.all.each do |user|
      dates = Record.pluck(:date)
      dates.each do |date|
        records = Record.where(user_id: user.id, date: date)
        if records.count > 1
          records.update_all(hour: (8.0 / records.count).ceil)
        end
      end
    end
  end 
end