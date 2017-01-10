class Record < ActiveRecord::Base
  belongs_to :user
  belongs_to :project

  validates :user_id, presence: true
  validates :project_id, presence: true, :uniqueness => {:scope => [:user_id, :date]}
  validates :date, presence: true
end
