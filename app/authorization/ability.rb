class Ability
  include CanCan::Ability

  def initialize(user = nil)
    # Define abilities for the passed in user here. For example:

    user ||= User.new # guest user (not logged in)

    if user.admin?
      can :manage, :all
    end
        
    can [:show, :index], Organization
    unless user.new_record?
      can :create, Organization
      can :manage, Organization do |organization|
        no_reviews = organization.reviews.count == 0
        only_review_by_user = organization.reviews.count == 1 && organization.reviews.first.user == user
        no_reviews || only_review_by_user
      end
    end
    
    can [:show, :index], Review
    can :manage, Review, :user_id => user.id unless user.new_record?
    
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user permission to do.
    # If you pass :manage it will apply to every action. Other common actions here are
    # :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. If you pass
    # :all it will apply to every resource. Otherwise pass a Ruby class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details: https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
end
