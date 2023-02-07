class OfficePolicy < ApplicationPolicy
  def home?
    true
  end

  def show?
    user.has_any_role?(
      :admin,
      {name: :manager, resource: record},
      {name: :sales, resource: record}
    )
  end

  def update?
    user.has_any_role?(
      :admin,
      {name: :manager, resource: record}
    )
  end
end
