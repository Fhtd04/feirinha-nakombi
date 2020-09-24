class Product < ApplicationRecord
  belongs_to :user
  has_many :orders
  has_one_attached :photo

  validates :name, :quantity, :price, presence: true
  validates :price, :quantity, numericality: { only_integer: true }
end
