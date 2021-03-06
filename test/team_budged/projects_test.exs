defmodule TeamBudged.ProjectsTest do
  use TeamBudged.DataCase

  alias TeamBudged.Projects

  describe "projects" do
    alias TeamBudged.Projects.Project

    @valid_attrs %{
      budget: "120.5",
      description: "some description",
      name: "some name",
      slug: "some slug"
    }
    @update_attrs %{
      budget: "456.7",
      description: "some updated description",
      name: "some updated name",
      slug: "some updated slug"
    }
    @invalid_attrs %{budget: nil, description: nil, name: nil, slug: nil}

    def project_fixture(attrs \\ %{}) do
      {:ok, project} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Projects.create_project()

      project
    end

    test "list_projects/0 returns all projects" do
      project = project_fixture()
      assert Projects.list_projects() == [project]
    end

    test "get_project!/1 returns the project with given id" do
      project = project_fixture()
      assert Projects.get_project!(project.id) == project
    end

    test "create_project/1 with valid data creates a project" do
      assert {:ok, %Project{} = project} = Projects.create_project(@valid_attrs)
      assert project.budget == Decimal.new("120.5")
      assert project.description == "some description"
      assert project.name == "some name"
      assert project.slug == "some slug"
    end

    test "create_project/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Projects.create_project(@invalid_attrs)
    end

    test "update_project/2 with valid data updates the project" do
      project = project_fixture()
      assert {:ok, %Project{} = project} = Projects.update_project(project, @update_attrs)
      assert project.budget == Decimal.new("456.7")
      assert project.description == "some updated description"
      assert project.name == "some updated name"
      assert project.slug == "some updated slug"
    end

    test "update_project/2 with invalid data returns error changeset" do
      project = project_fixture()
      assert {:error, %Ecto.Changeset{}} = Projects.update_project(project, @invalid_attrs)
      assert project == Projects.get_project!(project.id)
    end

    test "delete_project/1 deletes the project" do
      project = project_fixture()
      assert {:ok, %Project{}} = Projects.delete_project(project)
      assert_raise Ecto.NoResultsError, fn -> Projects.get_project!(project.id) end
    end

    test "change_project/1 returns a project changeset" do
      project = project_fixture()
      assert %Ecto.Changeset{} = Projects.change_project(project)
    end
  end
end
