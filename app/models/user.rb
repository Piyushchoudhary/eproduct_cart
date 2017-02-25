class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  after_create :send_admin_mail

  has_one :cart

  belongs_to :country_code

  validates :password, presence: true, length: {minimum: 5, maximum: 120}, on: :create

  validates :password, length: {minimum: 5, maximum: 120}, on: :update, allow_blank: true

  def send_admin_mail
    UserMailer.send_welcome_email(self).deliver_later
  end
end
