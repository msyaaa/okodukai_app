class Goal < ApplicationRecord
  validates :text, length: { maximum: 30 }

  belongs_to :user
end
