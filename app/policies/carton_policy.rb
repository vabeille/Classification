class CartonPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
      scope.where(user: user)
    end
  end

  def create?
    true # Tous les utilisateurs peuvent créer des cartons.
  end

  def show?
    true # Tous les utilisateurs peuvent consulter des cartons.
  end



  def update?
    user_is_owner_or_admin?
  end

  def destroy?
    user_is_owner_or_admin?
  end

  def sensible?
    true
  end

  private

  def user_is_owner_or_admin?
    user.admin || @record.user == user
  end

end
