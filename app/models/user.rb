class User < ApplicationRecord
  after_create :welcome_send
  after_create :create_cart
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :cart 
  has_many :orders

  validates :email, presence: true, format: /.+@.+\.{1}.{2,}/

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end

  def create_cart
    Cart.create(user_id: User.last.id)
  end
end
