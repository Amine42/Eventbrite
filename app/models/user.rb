class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :attendances, dependent: :destroy
  has_many :events, through: :attendances, dependent: :destroy # ffffff
  has_many :events, dependent: :destroy

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
