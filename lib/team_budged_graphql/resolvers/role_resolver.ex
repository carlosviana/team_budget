defmodule TeamBudgedGraphql.Resolvers.RoleResolver do
  alias TeamBudged.Roles

  def create_role(_parent, %{role: role}, _) do
    Roles.create_role(role)
  end

  def list_roles(_parent, _, _) do
    {:ok, Roles.list_roles()}
  end

  def update_role(_parent, %{role: role, id: id}, _) do
    Roles.update_role(role, id)
  end

  def delete_role(_parent, %{id: id}, _) do
    Roles.delete_role(id)
  end
end
