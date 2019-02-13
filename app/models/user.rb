class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :attendances
  has_many :events, through: :attendances # ffffff
  has_many :events

  validates :password, :presence => true,
    :confirmation => true,
    :length => {:within => 6..40},
    :on => :create
  validates :password, :confirmation => true,
    :length => {:within => 6..40},
    :allow_blank => true,
    :on => :update

  def welcome_send

    UserMailer.welcome_email(self).deliver_now
  end
end
