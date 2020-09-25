class Product < ApplicationRecord
  belongs_to :user
  has_many :orders
  has_one_attached :photo

  include PgSearch::Model
  pg_search_scope :search_by_name,
  against: [ :name ],
  using: {
    tsearch: { prefix: true }
  }

  validates :name, :quantity, :price, :photo, presence: true
  validates :price, :quantity, numericality: { only_integer: true }
end
