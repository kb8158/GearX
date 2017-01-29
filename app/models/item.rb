class Item < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :body, presence: true

end
