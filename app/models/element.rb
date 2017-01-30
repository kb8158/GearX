class Element < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :body, presence: true
  validates :date, presence: true
  validates :days, presence: true
  validates :days, numericality: true
  validates :zip_code, presence: true
  validates :zip_code, numericality: true
  validates :zip_code, length: {is: 5}
  validates :size, presence: true
end
