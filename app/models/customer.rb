class Customer < ApplicationRecord
  has_one_attached :avatar
  validates :full_name, :phone_number, presence: true
end
