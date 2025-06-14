class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the user here.
    user ||= User.new # guest user (not logged in)

    if user.admin?
      can :manage, :all # Admin can do everything
    elsif user.regular?
      # Regular users can read all posts and comments
      can :read, Post
      can :read, Comment

      # They can create new posts and comments
      can :create, Post
      can :create, Comment

      # They can only update or destroy their own posts and comments
      can :update, Post, user_id: user.id
      can :destroy, Post, user_id: user.id
      can :update, Comment, user_id: user.id
      can :destroy, Comment, user_id: user.id
    else
      # Guest users (not logged in) can only read posts
      can :read, Post
    end
  end
end