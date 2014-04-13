class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable
  acts_as_paranoid
  has_many :articles


  ROLES = ['member', 'admin']

  validate :first_name, :last_name, :role, presence: true

  validates :website_url, format: URI::regexp(%w(http https)), allow_blank: true
  validates :twitter_handle, format: /\A([a-zA-Z](_?[a-zA-Z0-9]+)*_?|_([a-zA-Z0-9]+_?)*)\z/, allow_blank: true
  validates :role, inclusion: {in: User::ROLES, message: "Role should be one of #{ROLES.join(", ")}"}


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
