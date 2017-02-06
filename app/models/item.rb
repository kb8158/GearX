class Item < ApplicationRecord
  belongs_to :lender, class_name: "User"
  belongs_to :borrower, class_name: "User", required: false

  has_many :reviews

  validates :name, presence: true
  validates :body, presence: true
  validates :zip_code, presence: true
  validates :zip_code, numericality: true
  validates :zip_code, length: { is: 5 }
  validates :size, presence: true

  def self.available
    where(borrower_id: nil)
  end

  def address
    return "#{self.zip_code}"
  end

end
