class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable
  
  has_many :articles

  validate :first_name, :last_name, :role, presence: true
  
  ROLES = ['member', 'admin']
  
  def admin?
    role == 'admin'
  end
  
  def member?
    role == 'member'
  end
  


  def full_name
    "#{first_name} #{last_name}"
  end
end
