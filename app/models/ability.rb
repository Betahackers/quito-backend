class Ability
  include CanCan::Ability

  def initialize(user)
      user ||= User.new # guest user (not logged in)
      if user.admin?
        can :manage, :all
      elsif user.member?
        can :manage, User, id: user.id
        can :manage, Article
      else
        can :read, :all
      end
  end
end
