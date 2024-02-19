class Book < ApplicationRecord
  has_and_belongs_to_many :genres
  belongs_to :publisher
  belongs_to :author

  validates :title, presence: true
  validates :publisher, presence: true
  validates :isbn, presence: true
end
