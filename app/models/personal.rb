class Personal < ApplicationRecord

  validates_presence_of :name, :last_name, :area
  validates :name, length: { minimum: 3}
  validates :last_name, :area, length: { minimum: 2}
  validates :years, numericality: {less_than_or_equal_to: 40}
end