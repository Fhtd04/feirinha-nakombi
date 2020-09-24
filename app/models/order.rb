class Order < ApplicationRecord
  belongs_to :user
  belongs_to :product

  validates :ask, presence: true
end
