class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Post
    can :read, Comment
    return unless user.present?

    can :manage, Post, author_id: user.id
    can :manage, Comment, author_id: user.id

    return unless user.admin?

    can :manage, :all
  end
end
