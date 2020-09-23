class Product < ApplicationRecord
  belongs_to :user
  has_many :orders

  validates :name, :quantity, :price, presence: true
  validates :price, :quantity, numericality: { only_integer: true }
end
