class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

         validate :password_complexity
         validates_uniqueness_of :nickname

  def password_complexity
	    if password.present? and not password.match(/^([a-zA-Z])*([0-9])*$/)
	      errors.add :password, "must include only alphabets and numbers"
	    end
  end


end
