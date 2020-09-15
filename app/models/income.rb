class Income < ApplicationRecord
  with_options presence: true do
    VALID_PRICE = /\A[0-9]+\z/
    validates :price, format: { with: VALID_PRICE }
    validates :price, numericality: { only_integer: true, greater_than: 0, less_than: 10_000_000 }
    validates :description, length: { maximum: 50 }
    validates :date
  end

  belongs_to :user

  def start_time
    self.date
  end
end
