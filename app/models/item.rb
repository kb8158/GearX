class Item < ApplicationRecord
  belongs_to :user
  has_many :exchanges

  validates :name, presence: true
  validates :body, presence: true
  validates :zip_code, presence: true
  validates :zip_code, numericality: true
  validates :zip_code, length: {is: 5}
  validates :size, presence: true
end
