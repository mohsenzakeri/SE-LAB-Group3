# encoding: UTF-8
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

         validate :password_complexity
         validates_uniqueness_of :nickname

  def password_complexity
	    if password.present? and not password.match(/^([a-zA-Z])*([0-9])*$/)
	      errors.add "رمز عبور فقط باید شامل حروف الفبای انگلیسی و اعداد باشد."
	    end
  end

  def name
    "#{firstname} #{lastname}"
  end

  has_many :games
  has_many :user_games

end
