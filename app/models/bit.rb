class Bit < ApplicationRecord
  belongs_to :lender, class_name: "User", foreign_key: "lender_id"
  belongs_to :borrower, class_name: "User", foreign_key: "borrower_id"

  validates :name, presence: true
  validates :body, presence: true
  validates :size, presence: true
end
