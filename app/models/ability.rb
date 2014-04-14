class Ability
  include CanCan::Ability

  def initialize(user)
      user ||= User.new # guest user (not logged in)
      
      can :read, :all
      
      if user.admin?
        can :manage, :all
      elsif user.member?
        can :manage, User, id: user.id
        can :manage, Article
      end
  end
end
