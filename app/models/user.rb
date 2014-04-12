class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

  validate :first_name, :last_name, :role, presence: true
  
  def admin?
    role == 'admin'
  end

  has_many :articles

end
