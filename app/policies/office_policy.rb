class OfficePolicy < ApplicationPolicy
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
