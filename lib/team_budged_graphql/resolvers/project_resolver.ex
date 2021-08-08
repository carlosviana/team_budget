defmodule TeamBudgedGraphql.Resolvers.ProjectResolver do
  def create_project(_parent, %{project: project}, %{
        context: %{team: team}
      }) do
        IO.inspect(team)
        IO.inspect(project)
    {:ok, %{}}
  end
end
