class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname, uniqueness: true
    VALID_PASSWORD = /\A[a-zA-Z0-9]+\z/
    validates :password, confirmation: true, format: { with: VALID_PASSWORD }, length: { minimum: 6 }
    validates :password_confirmation, length: { minimum: 6 }
  end

  has_many :incomes
  has_many :outgos
  has_one :goal

  def email_required?
    false
  end
  
  def email_changed?
    false
  end

  def will_save_change_to_email?
    false
  end
end
