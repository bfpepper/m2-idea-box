class Category < ApplicationRecord
  has_many :ideas
  validates :title, presence: true
end
