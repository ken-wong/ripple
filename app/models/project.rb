class Project < ActiveRecord::Base
  validates :name, presence: true
  validates :name, uniqueness: true
  has_many :records
end
