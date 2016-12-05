class Admin < ActiveRecord::Base
  has_secure_password
  validates :name, presence: true
  validates :name, uniqueness: true
  WEEKDAYS = %w[日 一 二 三 四 五 六]
end
