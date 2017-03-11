class Ability
  include CanCan::Ability

  def initialize(user)
    if user
      can :manage, Project, { user: user }
      can :manage, Todo, { project: { user: user } }
    end
  end
end
