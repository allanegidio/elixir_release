defmodule Mix.Tasks.BumpVersion do
  use Mix.Task

  @shortdoc "Bump version of project"

  @moduledoc """
  This is where we would put any long form documentation and doctests.
  """

  @impl Mix.Task
  def run(args) do
    mix_project_module = ElixirRelease.MixProject
    mix_project = mix_project_module.project()

    current_version = String.trim(mix_project[:version])
    new_version = List.first(args)

    file = mix_project_module.module_info()[:compile][:source]

    contents = File.read!(file)

    replace = "@version \"#{current_version}\""
    pattern = "@version \"#{new_version}\""

    new_contents = String.replace(contents, replace, pattern)

    File.write!(file, new_contents)

    String.trim(new_contents, contents)

    Mix.shell().info("Bumping version to #{new_version}!")
  end

  # We can define other functions as needed here.
end
