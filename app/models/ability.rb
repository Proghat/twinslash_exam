class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.role == 'user'
      can [:show, :update], User, id: user.id # can view and update self
      can :create, Order # can create new orders
      can [:read, :update], Order, user_id: user.id # can view and update own orders
    elsif user.role == 'admin'
      can [:manage, :change_role], User # can fully manage users
      cannot [:destroy, :change_role], User, id: user.id # but can't destroy self and change own role
      can [:manage, :complete], Order
    end
  end
end
