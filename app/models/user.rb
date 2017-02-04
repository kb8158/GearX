class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  mount_uploader :profile_photo, ProfilePhotoUploader

  has_many :items_listed, class_name: "Item", foreign_key: "lender_id"
  has_many :items_borrowed, class_name: "Item", foreign_key: "borrower_id"

  validates :first_name, presence: true
  validates :last_name, presence: true


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
