defmodule Tasktracker.Repo.Migrations.CreateTimeblocks do
  use Ecto.Migration

  def change do
    create table(:timeblocks) do
      add :begin_time, :utc_datetime
      add :end_time, :utc_datetime
      add :task_id, references(:tasks, on_delete: :nothing)

      timestamps()
    end

    create index(:timeblocks, [:task_id])
  end
end
