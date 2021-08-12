defmodule TeamBudgedGraphql.Resolvers.PermissionResolver do
  alias TeamBudged.Permissions

  def create_permission(_parent, %{permission: permission}, _) do
    Permissions.create_permission(permission)
  end

  def list_permissions(_parent, _, _) do
    {:ok, Permissions.list_permissions()}
  end

  def update_permission(_parent, %{permission: permission, id: id}, _) do
    Permissions.update_permission(permission, id)
  end

  def delete_permission(_parent, %{id: id}, _) do
    Permissions.delete_permission(id)
  end
end
