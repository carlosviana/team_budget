defmodule TeamBudged.PermissionsTest do
  use TeamBudged.DataCase

  alias TeamBudged.Permissions

  describe "permissions" do
    alias TeamBudged.Permissions.Permission

    @valid_attrs %{description: "some description", name: "some name", slug: "some slug"}
    @update_attrs %{
      description: "some updated description",
      name: "some updated name",
      slug: "some updated slug"
    }
    @invalid_attrs %{description: nil, name: nil, slug: nil}

    def permission_fixture(attrs \\ %{}) do
      {:ok, permission} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Permissions.create_permission()

      permission
    end

    test "list_permissions/0 returns all permissions" do
      permission = permission_fixture()
      assert Permissions.list_permissions() == [permission]
    end

    test "get_permission!/1 returns the permission with given id" do
      permission = permission_fixture()
      assert Permissions.get_permission!(permission.id) == permission
    end

    test "create_permission/1 with valid data creates a permission" do
      assert {:ok, %Permission{} = permission} = Permissions.create_permission(@valid_attrs)
      assert permission.description == "some description"
      assert permission.name == "some name"
      assert permission.slug == "some slug"
    end

    test "create_permission/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Permissions.create_permission(@invalid_attrs)
    end

    test "update_permission/2 with valid data updates the permission" do
      permission = permission_fixture()

      assert {:ok, %Permission{} = permission} =
               Permissions.update_permission(permission, @update_attrs)

      assert permission.description == "some updated description"
      assert permission.name == "some updated name"
      assert permission.slug == "some updated slug"
    end

    test "update_permission/2 with invalid data returns error changeset" do
      permission = permission_fixture()

      assert {:error, %Ecto.Changeset{}} =
               Permissions.update_permission(permission, @invalid_attrs)

      assert permission == Permissions.get_permission!(permission.id)
    end

    test "delete_permission/1 deletes the permission" do
      permission = permission_fixture()
      assert {:ok, %Permission{}} = Permissions.delete_permission(permission)
      assert_raise Ecto.NoResultsError, fn -> Permissions.get_permission!(permission.id) end
    end

    test "change_permission/1 returns a permission changeset" do
      permission = permission_fixture()
      assert %Ecto.Changeset{} = Permissions.change_permission(permission)
    end
  end
end
