defmodule Tasktracker.Repo.Migrations.AddTaskColumn do
  use Ecto.Migration

  def change do
    alter table(:tasks) do
      add :begin_time, :utc_datetime
      add :end_time, :utc_datetime
      remove :time
    end
  end
end
