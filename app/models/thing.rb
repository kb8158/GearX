class Thing < ApplicationRecord
  belongs_to :searcher, class_name: "User"
  belongs_to :finder, class_name: "User", required: false

  validates :name, presence: true
  validates :body, presence: true
  validates :zip_code, numericality: true, length: { is: 5}

  def self.needed
    where(finder_id: nil)
  end  

end
