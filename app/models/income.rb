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
  
  before_destroy :should_not_destroy_if_negative

  private
  def should_not_destroy_if_negative
    user = User.find(user_id)
    income_sum = user.incomes.sum(:price)
    outgo_sum = user.outgos.sum(:price)
    total = income_sum - outgo_sum
    income_price = Income.find(id).price
    if total - income_price < 0
      throw :abort
    end
  end
end
