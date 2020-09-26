class Goal < ApplicationRecord
  validates :text, length: { maximum: 25 }

  belongs_to :user
end
