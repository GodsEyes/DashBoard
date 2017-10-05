class Branch < ApplicationRecord
  validates :name, presence: true, length: {minimum: 3, maximum: 6}
  validates :code, presence: true, length: {minimum: 3, maximum: 8}
end
