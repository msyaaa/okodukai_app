class Outgo < ApplicationRecord
  with_options presence: true do
    VALID_PRICE = /\A[0-9]+\z/
    validates :price, format: { with: VALID_PRICE, message: 'は不正(ふせい)な値(あたい)です' }
    validates :price, numericality: { only_integer: true, message: 'は数値(すうち)で入力してください', greater_than: 0, less_than: 10_000_000 }
    validates :description, length: { maximum: 50 }
    validates :date
  end

  belongs_to :user

  def start_time
    self.date
  end
end
