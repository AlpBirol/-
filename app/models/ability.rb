class Ability
  include CanCan::Ability 

  def initialize( user ) 
    user ||= User.new                          # guest user 

    if user.admin?
      can :manage, :all
      can :access, :rails_admin
      can :dashboard
    end 
  end 
end 